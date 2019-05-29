require_relative 'robot_command'
require_relative '../directions/direction'
require_relative '../exception'

module Commands
	class PlaceCommand < RobotCommand

		def execute(robot, table)
			x, y, direction = arguments

			raise_for_invalid_placement unless table.valid_position?(x, y)

			position = Directions::Direction.new(x,y,direction)

			raise_for_invalid_parameters unless position.valid_direction?(direction)

      robot.update_position(x,y,direction)
    end

    private
    def raise_for_invalid_parameters
    	raise Exceptions::InvalidParameters.new("Invalid Parameters")
    end

    def raise_for_invalid_placement
    	raise Exceptions::InvalidPlacementCommand.new("Robot must be placed. Use <PLACE X,Y,DIRECTION>")
    end
	end
end