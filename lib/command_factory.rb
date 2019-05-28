require_relative "commands/place_command"
require_relative "commands/move_command"
require_relative "commands/turn_left_command"
require_relative "commands/turn_right_command"
require_relative "commands/report_command"

class CommandFactory

  VALID_COMMANDS = {
    place: Commands::PlaceCommand,
    move: Commands::MoveCommand,
    left: Commands::TurnLeftCommand,
    right: Commands::TurnRightCommand,
    report: Commands::ReportCommand,
  }

  def build(type, arguments)
    command_class = VALID_COMMANDS[type.to_sym]

    if command_class
      command_class.new(type, arguments)
    else
      #FIX-ME Change this
      puts "Invalid Command Type: #{type.to_s}"
      ## we can invert this dependency if we want to test it, etc.
      #$stderr.puts "Invalid command given #{type.to_s.upcase}"
      #NullRobotCommand.new(type: type, arguments: arguments)
    end
  end
end