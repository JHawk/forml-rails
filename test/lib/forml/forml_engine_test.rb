require_relative '../../test_helper'

describe Forml::FormlEngine do
  before do
    @option_string1 = "-option1"
    @option_string2 = "-option2"
    @options = [@option_string1, @option_string2]
    @file = "./some/file/path"
    @which_forml = "my_forml"
    @forml_engine = Forml::FormlEngine.new(@file, @options, @which_forml) 
  end

  it "news up" do
    @forml_engine.wont_be_nil
  end

  describe "#compile_command" do
    it "contains the forml path" do
      assert_match(@which_forml, @forml_engine.compile_command)
    end 

    it "contains the options" do
      @options.each do |option|
        assert_match(option, @forml_engine.compile_command(@options))
      end 
    end

    it "contains the file path" do
      assert_match(@file, @forml_engine.compile_command)
    end 
  end

  describe "#parse_forml_options" do
    it "returns matches" do
      options = %w[ -this_option -that_option ]
      message = "some stuff and #{options.join(" & ")}"
      assert_block do 
        options.all? do |option|
          @forml_engine.parse_forml_options(message).include?(option)
        end
      end
    end
  end

  describe "#filter_flags" do
    it "removes the failed flags" do 
      flag = "-flag"
      has_flag = "blah #{flag}"
      flags = %w[ -flag -another]
      assert_block do 
        !@forml_engine.filter_flags(has_flag,flags).include?(flag)
      end
    end 
  end
end
