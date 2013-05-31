# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resumator/version'

Gem::Specification.new do |s|
  s.name = "resumator-client"
  s.version = Resumator::VERSION

  s.authors = ["Kurt Nelson"]
  s.date = "2012-10-31"
  s.description = "Use the RESTful API found at resumatorapi.com"
  s.email = "kurtisnelson@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.homepage = "http://github.com/kurtisnelson/resumator"
  s.licenses = ["MIT"]
  s.rubygems_version = "1.8.24"
  s.summary = "Access the resumator API"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency 'faraday', ">= 0.8.4"
  s.add_dependency 'hashie'
  s.add_development_dependency 'rspec', ">= 2.8.0"
  s.add_development_dependency 'rdoc', ">= 3.12"
  s.add_development_dependency 'bundler', ">= 1.0.0"
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end

