require_relative 'robot_command'
require_relative '../directions/direction'
require_relative '../error'

module Commands
	class MoveCommand < RobotCommand

		def execute(robot, table)
			direction = Directions::Direction.new(robot.x, robot.y, robot.direction)
			direction.move_forward
			
			if table.valid_position?(direction.x, direction.y)
				robot.update_position(direction.x, direction.y, direction.direction)
			else
				raise Error.new("Invalid Position")
			end
			
    end
	end
end