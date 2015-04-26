# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'objectify_config/version'

Gem::Specification.new do |spec|
  spec.name          = "objectify_config"
  spec.version       = ObjectifyConfig::VERSION
  spec.authors       = ["Rajeev N B"]
  spec.email         = ["rajeevrvis@gmail.com"]

  if spec.respond_to?(:metadata)
  end

  spec.summary       = "Objectify your yml configuration files with support for arbitrary level of nesting"
  spec.homepage      = "https://github.com/rShetty/objectify_config"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
