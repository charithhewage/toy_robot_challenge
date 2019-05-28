require_relative 'robot'
require_relative 'table'
require_relative 'command_factory'
require_relative 'input_parser'

class Application
  attr_reader :robot, :table, :input_parser, :command_factory

  def initialize
    @robot = Robot.new
    @table = Table.new(5, 5)
    
    @command_factory 	= CommandFactory.new
    @input_parser 		= InputParser.new
  end

  def process!(line)
    input_data = input_parser.parse(line)
    
    command = command_factory.build(input_parser.type, input_parser.arguments)
    command.execute(robot, table)
  end

end