require 'platform-api'
require 'factor/connector/definition'

class HerokuConnectorDefinition < Factor::Connector::Definition
  id :github
  action :deploy do |params|
    app      = params[:app]
    content  = params[:content]
    user     = 'factorbot'
    api_key  = params[:api_key]

    fail 'No content specified. What am I supposed to deploy?' unless content
    fail 'No app specified. Where am I supposed to deploy it?' unless app
    fail 'You need to activate Heroku on the services page' unless api_key

    heroku = PlatformAPI.connect_oauth(api_key)

    info "Creating a build"
    begin
      build = heroku.build.create(app, {source_blob:{url:content}})
    rescue => ex
      fail "Build failed: #{ex.message}"
    end

    build_id = build['id']
    fail "Build failed: no build_id found" unless build_id

    info "Waiting on build to complete"
    begin
      begin
        build_info  = heroku.build.info(app,build_id)
        sleep 1
      end while build_info['status']=='pending'
    rescue => ex
      fail "Failed to get info while waiting: #{ex.message}"
    end

    fail "Build completed with status '#{build_info['status']}'" unless build_info['status']=='succeeded'
    slug_id = build_info['slug']['id'] if build_info['slug'] && build_info['slug']['id']

    fail "Build completed, but couldn't identify slug_id" unless slug_id

    info "Releasing code..."
    begin
      release = heroku.release.create(app, slug:slug_id)
    rescue => ex
      fail "Failed to release the code: #{ex.message}"
    end

    respond release
  end
end