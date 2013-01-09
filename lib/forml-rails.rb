require 'rubygems'
require 'forml/version'
require 'rails/generators/forml/assets/assets_generator'
require 'rails/engine'
require 'forml/forml_engine'
require 'forml/forml_template'

module Forml
  class FormlRails < Rails::Engine
    config.app_generators.javascript_engine :forml
    
    initializer :register_forml do |app|
      app.assets.register_engine '.forml', FormlTemplate
    end
  end
end