require_relative '../../test_helper'

describe Forml::VERSION do
  it "must be defined" do
    Forml::VERSION.wont_be_nil
  end
end