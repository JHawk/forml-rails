module Forml
  class FormlEngine
    def initialize(file, options)
      @file = file
      @options = options
    end

    def compile
      begin
        cmd = %Q{forml #{@file} -silent -flush -no-opt}
        puts cmd
        result = `#{cmd}`
        puts "Forml compiled!"
        result
      rescue Exception
        raise Error, "compression failed: #{result || $!}"
      end
    end
  end
end