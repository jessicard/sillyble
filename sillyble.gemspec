# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sillyble/version'

Gem::Specification.new do |spec|
  spec.name          = "sillyble"
  spec.version       = Sillyble::VERSION
  spec.authors       = ["jessicard, colinpilloud"]
  spec.email         = ["jessicard@mac.com, colin.pilloud@gmail.com"]
  spec.summary       = %q{Provides syllable counts and letters.}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 2.6"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
