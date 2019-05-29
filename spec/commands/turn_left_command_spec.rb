require "spec_helper"

require "robot"
require "table"
require "commands/turn_left_command"
require "directions/direction"

describe Commands::TurnLeftCommand do
  describe '#execute' do
    let(:table)   { Table.new }
    let(:robot)   { Robot.new }
    let(:command) { Commands::TurnLeftCommand.new("LEFT", nil) }

    context 'Robot valid placement' do
      context "When robot is facing to North" do
      	it "should rotate the robot to west for turn left" do
	        robot.update_position(0,0,"NORTH")

	        command.execute(robot,table)

	        #Should not change robot location
	        expect(robot.x).to eq(0)
	        expect(robot.y).to eq(0)
	        expect(robot.direction).to eq("WEST")
	      end
      end

      context "When robot is facing to East" do
      	it "should rotate the robot to north for turn left" do
	        robot.update_position(0,0,"EAST")
	        command.execute(robot,table)

	        expect(robot.direction).to eq("NORTH")
	      end
      end

      context "When robot is facing to South" do
      	it "should rotate the robot to East for turn left" do
	        robot.update_position(0,0,"SOUTH")
	        command.execute(robot,table)

	        expect(robot.direction).to eq("EAST")
	      end
      end

      context "When robot is facing to West" do
      	it "should rotate the robot to South for turn left" do
	        robot.update_position(0,0,"WEST")
	        command.execute(robot,table)

	        expect(robot.direction).to eq("SOUTH")
	      end
      end

    end

    context "Robot's invalid placement" do
      it "should raise an error when moving the robot without placement" do
        expect(Exceptions::InvalidPlacementCommand).to receive(:new).and_return("Robot must be placed. Use <PLACE X,Y,DIRECTION>")
        
        expect { command.send(:execute, robot, table) }.to raise_error "Robot must be placed. Use <PLACE X,Y,DIRECTION>"
      end
    end
  end
end