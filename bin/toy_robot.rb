#This is the inputs Reader
#Inputs can be from command line or a file.

require_relative '../lib/application.rb'

application = Application.new

begin
  ARGF.each_line { |line| 
    application.process!(line.strip) 
  }

rescue  SystemExit, Interrupt
  exit(1)
  
rescue Exception => e
  puts e.message
  retry
end