require_relative 'robot_command'
require_relative '../error'

module Commands
	class PlaceCommand < RobotCommand

		def execute(robot, table)
			x, y, direction = arguments

			raise Error.new("Invalid Position") unless table.valid_position?(x, y)

      robot.update_position(x,y,direction)
    end
	end
end