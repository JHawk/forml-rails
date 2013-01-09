module Forml
  class FormlEngine
    def initialize(file, options)
      @file = file
      @options = options
    end

    def compile
      begin
        # cmd = %Q{#{command} #{@file}}

        puts "*"*1000

        cmd = %Q{forml #{@file}}

        puts cmd

        result = `#{cmd}`
      rescue Exception
        raise Error, "compression failed: #{result || $!}"
      end
    end
  end
end