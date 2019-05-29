require_relative "commands/place_command"
require_relative "commands/move_command"
require_relative "commands/turn_left_command"
require_relative "commands/turn_right_command"
require_relative "commands/report_command"
require_relative "exception"

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
      raise Exceptions::CommandNotFound.new("Command <#{type}> not found", type)
    end
  end
end