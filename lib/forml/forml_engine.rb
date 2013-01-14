module Forml
  class Error < StandardError; end

  class FormlEngine
    def initialize(file, options)
      @file = file
      @forml = "forml"
      @options = options
    end

    def compile
      begin
        cmd = if ::Rails.env.production?
          %Q{#{@forml} -silent -flush -no-test #{@file}}
        else
          %Q{#{@forml} -silent -flush -no-opt -no-test #{@file}}
        end
        puts cmd
        result = `#{cmd}`
        result
      rescue Exception
        raise Error, "Compilation failed: #{result || $!}"
      end
    end
  end
end