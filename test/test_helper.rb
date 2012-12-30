# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require 'rails'
require 'rails/test_help'

# For generators
require 'rails/generators/test_case'

require 'minitest/autorun'
require 'minitest/pride'

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| load(f) }