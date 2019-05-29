require_relative "../exception"

module Commands
  class RobotCommand
    attr_reader :type, :arguments

    def initialize(type, arguments)
      @type = type
      @arguments = arguments
    end

    private
    def unauthorized_before_placing_robot
      raise Exceptions::InvalidPlacementCommand.new("Robot must be placed. Use <PLACE X,Y,DIRECTION>")
    end
    
  end
end