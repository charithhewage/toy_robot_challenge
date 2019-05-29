require_relative 'robot_command'
require_relative '../directions/direction'

module Commands
	class TurnLeftCommand < RobotCommand

		def execute(robot, table)
			unauthorized_before_placing_robot unless robot.placed?
			
			direction = Directions::Direction.new(robot.x, robot.y, robot.direction)
			direction.turn_left
			
			robot.update_position(direction.x, direction.y, direction.direction)
			
    end
	end
end