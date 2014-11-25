require 'factor-connector-api'
require 'json'
require 'rest-client'

Factor::Connector.service 'heroku' do
  action 'deploy' do |params|
    app      = params['app']
    content  = params['content']
    user     = 'factorbot'
    api_key  = params['api_key']

    fail 'No content specified. What am I supposed to deploy?' unless content
    fail 'No app specified. Where am I supposed to deploy it?' unless app
    fail 'You need to activate Heroku on the services page' unless api_key

    base     = 'https://api.heroku.com'
    app_base = "#{base}/apps/#{app}"
    headers  = {
      'Authorization' => "Bearer #{api_key}",
      'Accept' => 'application/vnd.heroku+json; version=3',
      'Content-Type' => 'application/json'
    }

    action_callback deploy_info:''
  end
end