# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/parts/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-parts"
  spec.version       = Rspec::Parts::VERSION
  spec.authors       = ["James Hart"]
  spec.email         = ["james@wanelo.com"]

  spec.summary       = %q{Split your rspec suite into equal parts}
  spec.description   = %q{Split your rspec suite into equal parts}
  spec.homepage      = "http://github.com/hjhart/rspec-parts"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "rspec"
  spec.add_dependency "rake"
end
