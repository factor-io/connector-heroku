# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-heroku'
  s.version       = '0.0.7'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Maciej Skierkowski']
  s.email         = ['maciej@factor.io']
  s.homepage      = 'https://factor.io'
  s.summary       = 'Heroku Factor.io Connector'
  s.files         = ['lib/factor/connector/heroku.rb']
  
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rest-client', '~> 1.7.2'
  s.add_runtime_dependency 'json', '1.8.1'
  s.add_runtime_dependency 'factor-connector-api', '~> 0.0.3'
end