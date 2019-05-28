require_relative './north_direction'

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
			North.move_forward(x,y)
		end

		def to_s
	    "#{x},#{y},#{direction}"
	  end

	end
end