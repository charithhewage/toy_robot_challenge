require_relative 'command'
require_relative 'invalid_command'

class Robot
	include Command

	def initialize(table_size=6)
		@table_size = table_size
		@robots = Hash.new

		@directions = directions
	end

	def execute_command(robot_name, args)
		#command #0,0,north
  	command, options = args.split(" ") if args

  	options = options.split(",") if options
    
    begin
      send(command, *options, robot_name)

    rescue ArgumentError => e
      raise e.message  
    end
	end

  def read_command(line)
  	line = line.strip.downcase

  	#alice  #place 0,0,north
  	robot_name, args = line.split(/\s+/, 2)
  	robot_name = robot_name.tr(":", "").to_sym

  	#Set robot name 
  	@robots[robot_name] ||= []

  	#Execute the command for each robot
  	execute_command(robot_name, args) if args

  end


  def execute_file
  	File.open('bin/script.txt').each do |line|
  		begin
        read_command(line)

      rescue StandardError => e
      	puts e.message  
      end
  	end
  end

  private
  def validate(x, y, face)
    raise InvalidCommand.new unless x && y && face
    raise InvalidCommand.new unless (0..@table_size) === x
    raise InvalidCommand.new unless (0..@table_size) === y
  end

  def directions
  	{
			#direction => [left, right, move x, move y]
			north: [:west, :east, 0, +1],
			east: [:north, :south, +1, 0],
			south: [:west, :east, 0, -1],
			west: [:south, :north, -1, 0]
		}
  end

end

Robot.new.execute_file