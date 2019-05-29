class Table
  attr_reader :width, :height

  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def valid_position?(x, y)
    valid_x?(x.to_i) && valid_y?(y.to_i)
  end

  private

  def valid_x?(x)
    0 <= x && x <= @width
  end

  def valid_y?(y)
    0 <= y && y <= @height
  end
end