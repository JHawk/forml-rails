require 'rails/engine'

module Forml
  class Engine < Rails::Engine
    config.app_generators.javascript_engine :forml
  end
end