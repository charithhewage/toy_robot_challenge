class InputParser

  attr_reader :type, :arguments

  def initialize
    @type = nil
    @arguments = nil
  end

  def parse(input_line)
    type, arguments = input_line.strip.split(/\s+/, 2)
    arguments = arguments.to_s.strip.split(',').map(&:strip)

    @type = type.downcase || ""
    @arguments = arguments || []
  end
end