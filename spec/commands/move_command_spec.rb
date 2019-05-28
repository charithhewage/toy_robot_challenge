require "spec_helper"
require "robot"
require "table"
require "commands/move_command"
require "directions/direction"

describe Commands::MoveCommand do
  describe '#execute' do
    let(:table)   { Table.new }
    let(:robot)   { Robot.new }
    let(:command) { Commands::MoveCommand.new("MOVE", nil) }

    context 'Robot valid placement' do
      context "When robot is facing to North" do
      	it 'should increase y by 1 when moving the robot' do
	        robot.update_position(0,0,"NORTH")

	        command.execute(robot,table)

	        expect(robot.x).to eq(0)
	        expect(robot.y).to eq(1)
	        expect(robot.direction).to eq("NORTH")
	      end

	      it 'Should raise error when falling the robot from the table' do
	        robot.update_position(5,5,"NORTH")

	        expect { command.send(:execute, robot, table) }.to raise_error("Invalid Position")
	      end
      end

      context "When robot is facing to East" do
      	it 'should increase x by 1 when moving the robot' do
	        robot.update_position(0,0,"EAST")

	        command.execute(robot,table)

	        expect(robot.x).to eq(1)
	        expect(robot.y).to eq(0)
	        expect(robot.direction).to eq("EAST")
	      end
      end

      context "When robot is facing to South" do
      	it 'should decrease y by 1 when moving the robot' do
	        robot.update_position(3,4,"SOUTH")

	        command.execute(robot,table)

	        expect(robot.x).to eq(3)
	        expect(robot.y).to eq(3)
	        expect(robot.direction).to eq("SOUTH")
	      end
      end

      context "When robot is facing to West" do
      	it 'should decrease x by 1 when moving the robot' do
	        robot.update_position(3,4,"WEST")

	        command.execute(robot,table)

	        expect(robot.x).to eq(2)
	        expect(robot.y).to eq(4)
	        expect(robot.direction).to eq("WEST")
	      end
      end

    end

    context "Robot's invalid placement" do
      it "should raise an error when moving the robot without placement" do
        expect { command.send(:execute, robot, table) }.to raise_error("Invalid Command")
      end
    end
  end
end