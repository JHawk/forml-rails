require 'test_helper'
require 'rails/generators/rails/controller/controller_generator'

class ControllerGeneratorTest < Rails::Generators::TestCase
  tests Rails::Generators::ControllerGenerator

  destination File.expand_path("../tmp", __FILE__)

  setup do
    prepare_destination
    copy_routes
  end

  def test_controller
    run_generator %w(abcs --javascript-engine=forml --orm=false)
    assert_no_file "app/assets/javascripts/abcs.js"
    assert_file "app/assets/javascripts/abcs.js.forml"
  end
end
