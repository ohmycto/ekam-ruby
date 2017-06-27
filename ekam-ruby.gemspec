lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ekam-ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'ekam-ruby'
  spec.version       = Ekam::VERSION
  spec.authors       = ['Denis Lukyanov']
  spec.email         = ['d.lukyanov@secoint.ru']
  spec.summary       = 'Simple API client for EKAM'
  spec.description   = 'Implementation of EKAM API v0.0.1 (https://app.ekam.ru/online/swagger)'
  spec.homepage      = 'https://github.com/secoint/ekam-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.11'
  
  spec.add_development_dependency 'bundler', '~> 1.0'
end