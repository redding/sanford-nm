# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sanford-nm/version"

Gem::Specification.new do |gem|
  gem.name        = "sanford-nm"
  gem.version     = Sanford::Nm::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.description = %q{Sanford template engine for Nm templates}
  gem.summary     = %q{Sanford template engine for Nm templates}
  gem.homepage    = "http://github.com/redding/sanford-nm"
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("assert", ["~> 2.15"])

  gem.add_dependency("sanford", ["~> 0.16"])
  gem.add_dependency("nm",      ["~> 0.5"])

end
