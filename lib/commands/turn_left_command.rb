require_relative 'robot_command'
require_relative '../directions/direction'

module Commands
	class TurnLeftCommand < RobotCommand

		def execute(robot, table)
			puts "called turn left"
			direction = Directions::Direction.new(robot.x, robot.y, robot.direction)
			direction.turn_left
			
			robot.update_position(direction.x, direction.y, direction.direction)
			
    end
	end
end