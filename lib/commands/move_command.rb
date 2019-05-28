require_relative 'robot_command'
require_relative '../directions/direction'

module Commands
	class MoveCommand < RobotCommand

		def execute(robot, table)
			
			direction = Directions::Direction.new(robot.x, robot.y, robot.direction)
			new_direction = direction.move_forward
			robot.update_position(new_direction.x, new_direction.y, new_direction.direction)
			
			#raise "Not Valid" unless table.valid_position?(arguments[0], arguments[1])
      #robot.update_position(arguments)
    end
	end
end