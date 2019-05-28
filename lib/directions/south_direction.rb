module Directions
  module South
    class << self
      
      def turn_left(x,y)
        [x, y, "WEST"]
      end

      def turn_right(x,y)
        [x, y, "EAST"]
      end

      def move_forward(x,y)
        [x, y-1, "SOUTH"]
      end
    end
  end
end