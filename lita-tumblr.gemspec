Gem::Specification.new do |spec|
  spec.name          = "lita-tumblr"
  spec.version       = "0.0.1"
  spec.authors       = ["Aiden Scandella"]
  spec.email         = ["aiden@uber.com"]
  spec.description   = %q{annoy erik}
  spec.summary       = %q{for realz}
  spec.homepage      = "http://sca.ndella.com"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0.beta2"
end
