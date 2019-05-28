require_relative "../error"

module Commands
	class RobotCommand
		attr_reader :type, :arguments

    def initialize(type, arguments)
      @type = type
      @arguments = arguments
    end

    def execute(robot, table)
      raise Error.new("Base class #{self.class.name} should not be used directly")
    end
	end
end