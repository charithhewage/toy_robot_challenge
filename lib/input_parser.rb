class InputParser

  attr_reader :type, :arguments

  def initialize
    @type=nil
    @arguments=nil
  end

  #FIX-ME Inputs validations
  def parse(input_line)
    type, arguments_string = input_line.strip.split(/\s+/, 2)
    arguments = arguments_string.to_s.strip.split(',').map(&:strip)

    @type = type.downcase || ""
    @arguments = arguments || []
  end
end