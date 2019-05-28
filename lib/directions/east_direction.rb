module Directions
  module East
    class << self
      
      def turn_left(x,y)
        [x, y, "NORTH"]
      end

      def turn_right(x,y)
        [x, y, "SOUTH"]
      end

      def move_forward(x,y)
        [x+1, y, "EAST"]
      end
    end
  end
end