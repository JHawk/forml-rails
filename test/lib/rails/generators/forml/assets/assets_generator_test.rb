require_relative '../../../../../test_helper'
require 'rails/generators/forml/assets/assets_generator'

class AssetsGeneratorTest < Rails::Generators::TestCase
  tests Forml::Generators::AssetsGenerator

  destination File.expand_path("../tmp", __FILE__)
  setup :prepare_destination

  def test_generation
    run_generator %w(whatever)
    assert_no_file "app/assets/javascripts/whatever.js"
    assert_file "app/assets/javascripts/whatever.js.forml"
  end
end