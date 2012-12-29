Gem::Specification.new do |s|
  s.name          = 'forml-rails'
  s.version       = Forml::Rails::VERSION
  s.platform      = Gem::Platform::RUBY
  s.date          = '2012-12-25'
  s.summary       = %q{Forml adapter for the Rails asset pipeline.}
  s.description   = %q{Forml adapter for the Rails asset pipeline.}
  s.authors       = ["Joshua Hawkins"]
  s.email         = ''
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]
  s.executables   = []
  s.homepage      = "https://github.com/JHawk/forml-rails"
end