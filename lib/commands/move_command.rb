require_relative 'robot_command'
require_relative '../directions/direction'
require_relative '../exception'

module Commands
  class MoveCommand < RobotCommand

    def execute(robot, table)
      unauthorized_before_placing_robot unless robot.placed?

      direction = Directions::Direction.new(robot.x, robot.y, robot.direction)
      direction.move_forward
      
      if table.valid_position?(direction.x, direction.y)
        robot.update_position(direction.x, direction.y, direction.direction)
      else
        raise Exceptions::InvalidParameters.new("Invalid Parameters (#{direction.x}, #{direction.y})")
      end

    end
  end
end