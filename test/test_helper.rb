# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require 'rails'
require 'rails/test_help'

# For generators
require 'rails/generators/test_case'

require 'minitest/autorun'
require 'minitest/pride'

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| load(f) }

def copy_routes
  routes = File.expand_path("../support/routes.rb", __FILE__)
  destination = File.join(destination_root, "config")

  FileUtils.mkdir_p(destination)
  FileUtils.cp routes, destination
end