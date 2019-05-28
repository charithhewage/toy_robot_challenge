require_relative 'robot_command'
require_relative '../directions/direction'

module Commands
	class MoveCommand < RobotCommand

		def execute(robot, table)
			direction = Directions::Direction.new(robot.x, robot.y, robot.direction)
			direction.move_forward
			
			robot.update_position(direction.x, direction.y, direction.direction)
			
    end
	end
end