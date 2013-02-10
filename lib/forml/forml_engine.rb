module Forml
  class Error < StandardError; end

  class FormlEngine
    COMMON_FLAGS = %w[ -silent -flush -no-test ]
    DEV_FLAGS  = COMMON_FLAGS + %w[ -no-opt ]
    PROD_FLAGS = COMMON_FLAGS + %w[ -remote ]
    FORML_OPTIONS_FAIL = "Could not parse options"
    
    def initialize(file, options, which_forml=nil)
      @file = file
      @which_forml = which_forml ? which_forml : "forml"
      @options = options
    end

    def compile_command(flags=[])
      %Q{#{@which_forml} #{flags.join(" ")} #{@file}}
    end

    def parse_forml_options(string)
      string.scan(/[-]+[a-zA-Z0-9_]+/)
    end

    def drop_remote_flag(flags)
      puts "Dropping the -remote flag."
      flags - %w[ -remote ]
    end

    def try_compile(flags)
      puts compile_command(flags)
      result = `#{compile_command(flags)}`
      if result.include?(FORML_OPTIONS_FAIL) || result.empty?
        puts "Trying compilation again."
        flags = drop_remote_flag(flags)
        try_compile(flags - parse_forml_options(result))
      else
        puts "Compiled - #{@file}"
        result
      end 
    end

    def compile
      begin
        try_compile(::Rails.env.production? ? PROD_FLAGS : DEV_FLAGS)
      rescue Exception
        raise Error, "Compilation failed: #{result || $!}"
      end
    end
  end
end
