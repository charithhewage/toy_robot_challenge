require_relative './north_direction'
require_relative './east_direction'
require_relative './south_direction'
require_relative './west_direction'

module Directions
	class Direction

		attr_reader :x, :y, :direction

		VALID_DIRECTIONS = [:north, :east, :south, :west]

		def initialize(x, y, direction)
	    @x = x.to_i || @x
	    @y = y.to_i || @y
	    @direction = direction.to_s || @direction
	  end

		def valid_direction?(direction)
			direction && VALID_DIRECTIONS.include?(direction.downcase.to_sym)
		end

		def move_forward
			moved_directions = instance_eval(@direction.capitalize).move_forward(x,y)
			
			update_direction(moved_directions)
		end

		def turn_left
			turned_direction = instance_eval(@direction.capitalize).turn_left(x,y)
			
			update_direction(turned_direction)
		end

		def turn_right
			turned_direction = instance_eval(@direction.capitalize).turn_right(x,y)
			
			update_direction(turned_direction)
		end

		def to_s
	    "#{x},#{y},#{direction}"
	  end

	  protected
	  def update_direction(directions)
	  	x, y, direction = directions

	    @x = x || @x
	    @y = y || @y
	    @direction = direction || @direction
	  end

	end
end