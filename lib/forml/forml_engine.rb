module Forml
  class FormlEngine
    def initialize(file, options)
      @file = file
      @options = options
    end

    def compile
      begin
        cmd = %Q{forml #{@file} -silent -no-opt}
        puts cmd
        result = `#{cmd}`
        puts "Forml compiled."
      rescue Exception
        raise Error, "compression failed: #{result || $!}"
      end
    end
  end
end