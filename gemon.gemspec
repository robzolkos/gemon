# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemon/version'

Gem::Specification.new do |spec|
  spec.name          = "gemon"
  spec.version       = Gemon::VERSION
  spec.authors       = ["Rob Zolkos"]
  spec.email         = ["robzolkos@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.4"
  spec.add_development_dependency "rake"

  spec.add_dependency "sinatra"
  spec.add_dependency "bundler", ">= 1.4"
end