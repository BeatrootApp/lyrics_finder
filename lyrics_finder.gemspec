# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lyrics_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "lyrics_finder"
  spec.version       = LyricsFinder::VERSION
  spec.authors       = ["Daniel Romero"]
  spec.email         = ["dromveg@gmail.com"]
  spec.summary       = %q{Find song lyrics}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr", "~> 2.4.0"

  spec.add_runtime_dependency "nokogiri", ">= 1.6.1"
  spec.add_runtime_dependency "activesupport", "~> 4.1"
  spec.add_runtime_dependency "i18n"

end
