require_relative 'robot_command'
require_relative '../directions/direction'

module Commands
	class TurnRightCommand < RobotCommand

		def execute(robot, table)
			puts "called turn Right"
			direction = Directions::Direction.new(robot.x, robot.y, robot.direction)
			direction.turn_right
			
			robot.update_position(direction.x, direction.y, direction.direction)
			
    end
	end
end