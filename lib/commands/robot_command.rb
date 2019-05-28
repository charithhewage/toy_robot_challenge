require_relative "../error"

module Commands
	class RobotCommand
		attr_reader :type, :arguments

    def initialize(type, arguments)
      @type = type
      @arguments = arguments
    end
    
	end
end