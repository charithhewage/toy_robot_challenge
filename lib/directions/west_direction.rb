module Directions
  module West
    class << self
      
      def turn_left(x,y)
        [x, y, "SOUTH"]
      end

      def turn_right(x,y)
        [x, y, "NORTH"]
      end

      def move_forward(x,y)
        [x-1, y, "WEST"]
      end
    end
  end
end