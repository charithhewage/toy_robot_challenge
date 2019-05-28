class Robot

  attr_accessor :x, :y, :direction

  def initialize
    @x = nil
    @y = nil
    @direction = nil
  end

  def update_position(x,y, direction)

    @x = x || @x
    @y = y || @y
    @direction = direction || @direction
  end

  def placed?
    !(x.nil? || y.nil? || direction.nil?)
  end

end