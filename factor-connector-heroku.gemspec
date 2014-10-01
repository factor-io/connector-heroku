# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-heroku'
  s.version       = '0.0.2'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Maciej Skierkowski']
  s.email         = ['maciej@factor.io']
  s.homepage      = 'https://factor.io'
  s.summary       = 'Heroku Factor.io Connector'
  s.files         = ['lib/factor/connector/heroku.rb']
  
  s.require_paths = ['lib']

  s.add_runtime_dependency 'heroku-anvil-factor', '0.15.0'
  s.add_runtime_dependency 'heroku-api', '0.3.15'
  s.add_runtime_dependency 'rest-client', '1.6.7'
  s.add_runtime_dependency 'rubyzip', '~> 1.1.6'
  s.add_runtime_dependency 'oauth2', '0.9.3'
  s.add_runtime_dependency 'json', '1.8.1'
  s.add_runtime_dependency 'factor-connector-api', '~> 0.0.1'
end