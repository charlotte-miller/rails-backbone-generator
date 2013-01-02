# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rails_backbone_generator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rails-backbone-generator"
  gem.authors       = ["Chip Miller"]
  gem.email         = ["charlespmiller@gmail.com"]
  gem.description   = %q{Rails generators for backbone Models, Collections, & Views.}
  gem.summary       = %q{Inspired by ``rails generate`` this gem handles the tedious work of setting-up Backbone classes w/ Jasmine Tests and Factories }
  gem.homepage      = "https://github.com/chip-miller/rails-backbone-generator"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.version       = RailsBackboneGenerator::VERSION
  
  gem.add_development_dependency "bundler", ">= 1.0.0"
  gem.add_development_dependency "rails", ">= 3.0.0"
  gem.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  gem.rdoc_options = ["--charset=UTF-8"]
end
