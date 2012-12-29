# -*- encoding: utf-8 -*-
require File.expand_path('../lib/forml/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joshua Hawkins"]
  gem.email         = ["josh.r.hawk@gmail.com"]
  gem.summary       = %q{Forml adapter for the Rails asset pipeline.}
  gem.description   = %q{Forml adapter for the Rails asset pipeline.}
  gem.homepage      = "https://github.com/JHawk/forml-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "forml-rails"
  gem.require_paths = ["lib"]
  gem.version       = Forml::VERSION
end
