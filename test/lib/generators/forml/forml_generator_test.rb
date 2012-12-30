require_relative '../../../test_helper'
require 'generators/forml/forml_generator'

class FormlGeneratorTest < Rails::Generators::TestCase
  tests Forml::Generators::FormlGenerator

  destination File.expand_path("../tmp", __FILE__)
  setup :prepare_destination

  def test_generation
    run_generator %w(whatever)
    assert_no_file "app/assets/javascripts/whatever.js"
    assert_file "app/assets/javascripts/whatever.js.forml"
  end
end