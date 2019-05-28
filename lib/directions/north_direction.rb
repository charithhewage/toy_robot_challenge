module Directions
  module North
    class << self
      
      def turn_left
        South.to_s
      end

      def turn_right
        North.to_s
      end

      def move_forward(x,y)
        Direction.new(x, y+1, "NORTH")
      end

      def to_s
        "WEST"
      end
    end
  end
end