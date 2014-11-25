# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-heroku'
  s.version       = '0.0.8'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Maciej Skierkowski']
  s.email         = ['maciej@factor.io']
  s.homepage      = 'https://factor.io'
  s.summary       = 'Heroku Factor.io Connector'
  s.files         = ['lib/factor/connector/heroku.rb']
  
  s.require_paths = ['lib']

  s.add_runtime_dependency 'platform-api', '~> 0.2.0'
  s.add_runtime_dependency 'factor-connector-api', '~> 0.0.13'
end