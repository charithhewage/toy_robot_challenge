#This is the inputs Reader
#Inputs can be from command line or a file.

require_relative '../lib/application.rb'

application = Application.new

ARGF.each_line { |line| 
  application.process!(line.strip) 
}