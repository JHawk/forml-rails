module Forml
  class Error < StandardError; end

  class FormlEngine

    @@common_flags = %w[ -silent -flush -no-test ]
    @@dev_flags  = @@common_flags + %w[ -no-opt ]
    @@prod_flags = @@common_flags + %w[ -remote ]
    @@forml_options_fail = "Could not parse options"
    @@forml = "forml"

    def initialize(file, options, which_forml=@@forml)
      @file = file
      @which_forml = which_forml
      @options = options
    end

    def standard_forml? ; @which_forml == @@forml ; end

    def compile_command(flags=[])
      %Q{#{@which_forml} #{flags.join(" ")} #{@file}}
    end

    def parse_forml_options(string)
      string.scan(/[-]+[a-zA-Z0-9_]+/)
    end

    # Hack for now - remove when compiler support for this flag available
    def drop_remote_flag(flags)
      puts "Dropping the -remote flag." if flags.include?("-remote")
      flags - %w[ -remote ]
    end

    def filter_flags(result,flags)
        new_flags = drop_remote_flag(flags)
        new_flags = new_flags - parse_forml_options(result)
        if flags.sort == new_flags.sort
          raise Error, "Flag Set passed to forml is incorrect : #{new_flags}"
        else
          new_flags 
        end
    end

    def try_compile(flags)
      puts compile_command(flags)
      result = `#{compile_command(flags)}`

      if result.include?(@@forml_options_fail)
        puts "Trying compilation again."
        try_compile(filter_flags(result,flags))
      else
        puts "Compiled - #{@file}"
        result
      end
    end

    def check_for_forml
      which_result = `which forml`
      file_check = File.exists?(@which_forml)
      if which_result.empty? && standard_forml?
        puts which_result
        raise Error, "Forml doesn't appear to be installed. For instructions try http://texodus.github.com/forml/"
      end
      if !standard_forml? && !file_check
        raise Error, "Forml couldn't be found at #{@which_forml}."
      end
    end

    def compile
      check_for_forml
      begin
        result = try_compile(::Rails.env.production? ? @@prod_flags : @@dev_flags)
      rescue Exception
        raise Error, "Compilation failed: #{result || $!}"
      end
    end
  end
end
