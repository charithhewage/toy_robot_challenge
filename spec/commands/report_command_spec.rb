require "spec_helper"

require "robot"
require "table"
require "commands/report_command"
require "directions/direction"

describe Commands::ReportCommand do
	
  describe '#execute' do
    let(:table)   { Table.new }
    let(:robot)   { Robot.new }
    let(:command) { Commands::ReportCommand.new("REPORT", nil) }

    context "Robot valid placement" do
      it "Should report robot's position correctly" do
        robot.update_position(0,0,"NORTH")

        expect{command.send(:execute, robot,table) }.to output("0,0,NORTH\n").to_stdout
      end
    end
  end
end