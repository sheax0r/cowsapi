# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cowsapi/version'

Gem::Specification.new do |spec|
  spec.name          = "cowsapi"
  spec.version       = Cowsapi::VERSION
  spec.authors       = ["Michael Shea"]
  spec.email         = ["mike.shea@gmail.com"]
  spec.summary       = %q{Cowsay API}
  spec.homepage      = "https://github.com/sheax0r/cowsapi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_dependency 'sinatra', '~> 1.4'
  spec.add_dependency 'thin', '~> 1.6'
  spec.add_dependency 'padrino', '~> 0.12'
  spec.add_dependency 'slim', '~> 2.1.0'
end
