module Forml
  class FormlEngine
    def initialize(file, options)
      @file = file
      @options = options
    end

    def compile
      begin
        cmd = if ::Rails.env.production?
          %Q{forml #{@file} -silent -flush}
        else
          %Q{forml #{@file} -silent -flush -no-opt}
        end
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