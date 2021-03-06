# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hana/version"

Gem::Specification.new do |spec|
  spec.name = "hana"
  spec.version       = Hana::VERSION
  spec.authors       = ["temifowotade"]
  spec.email         = ["temitope.fowotade@andela.com"]

  spec.summary       = "Hana"
  spec.description   = "A simple Ruby MVC framework"
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack-test", "~> 0.6"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "capybara"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "tilt"
  spec.add_runtime_dependency "pry"
  spec.add_runtime_dependency "sqlite3"
end
