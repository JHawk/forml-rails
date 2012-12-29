require 'minitest/autorun'
require 'minitest/pride'

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| load(f) }