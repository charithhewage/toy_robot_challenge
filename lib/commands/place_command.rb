require_relative 'robot_command'

module Commands
	class PlaceCommand < RobotCommand

		def execute(robot, table)
			x, y, direction = arguments

			raise "Not Valid" unless table.valid_position?(x, y)

      robot.update_position(x,y,direction)
    end
	end
end