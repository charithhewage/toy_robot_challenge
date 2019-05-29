require_relative 'robot_command'

module Commands
  class ReportCommand < RobotCommand

    def execute(robot, table)
      # 0,0,NORTH
      puts "#{robot.x},#{robot.y},#{robot.direction.upcase}"
    end
  end
end