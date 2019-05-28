require_relative 'robot_command'
require_relative '../directions/direction'
require_relative '../error'

module Commands
	class PlaceCommand < RobotCommand

		def execute(robot, table)
			x, y, direction = arguments

			raise Error.new("Invalid Position") unless table.valid_position?(x, y)

			position = Directions::Direction.new(x,y,direction)
			raise Error.new("Invalid Direction") unless position.valid_direction?(direction)

      robot.update_position(x,y,direction)
    end
	end
end