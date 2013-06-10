require 'optparse'
require 'ostruct'
require 'md2cnblog'

module Md2Cnblog
  class OptParser

    def initialize()
      @option = OpenStruct.new
    end

    def do(args)
      parser = OptionParser.new do |opts| 
        opts.banner = 'Usage: mdt [type] filename'

        opts.separator ""
        opts.separator "Specific options:"

        opts.on('-t', '--type [BLOGTYPE]', 
               'the blog type to translate') do |t|
          @option.type = t 
        end 

        opts.separator ''
        opts.separator 'Common options:'

        opts.on_tail('-h', '--help', 'show this message') do
          puts opts
          exit
        end
      end # new
      parser.parse!(args)
      @option
    end # do

  end # OptParser
  
  o = OptParser.new.do(ARGV) 
  type = o.type || 'base'

  type = 'iteye' if type == 'csdn'
  
  raise 'your should specify a file' if ARGV.empty? 
  file = ARGV.first
  str = ''
  File.open(file) do |f|
    str = f.read
  end

  kls = "#{type.capitalize}Translator".to_sym
  Md2Cnblog.const_get(kls).new(str).start
  
end #Md2Cnblog
