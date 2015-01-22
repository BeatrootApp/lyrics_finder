# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lyrics_finder/version'

Gem::Specification.new do |spec|
  spec.name          = 'lyrics_finder'
  spec.version       = LyricsFinder::VERSION
  spec.authors       = ['Daniel Romero']
  spec.email         = ['dromveg@gmail.com']
  spec.summary       = %q{Solution for finding song lyrics}
  spec.description   = %q{Simple library for finding song lyrics}
  spec.homepage      = 'https://github.com/dnlR/lyrics_finder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'vcr', '~> 2.9.2'
  spec.add_development_dependency 'webmock', '~> 1.19.0'
  spec.add_development_dependency 'coveralls', '~> 0.7.0'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'pry-byebug', '~> 2.0.0'
  spec.add_development_dependency 'awesome_print', '~> 1.6.1'

  spec.add_dependency 'nokogiri', '~> 1.6.0'
  spec.add_dependency 'activesupport', '~> 4.1.0' # Not working with activesupport 4.2
  spec.add_dependency 'i18n', '~> 0.6'
  spec.add_dependency 'thor', '~> 0.19.1'
end
