require_relative "commands/place_command"
require_relative "commands/move_command"
require_relative "commands/turn_left_command"
require_relative "commands/turn_right_command"
require_relative "commands/report_command"
require_relative "error"

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
      raise Error.new("Invalid Command Type: #{type.to_s}")
    end
  end
end