require "spec_helper"
require "robot"
require "table"
require "commands/place_command"
require "directions/direction"

describe Commands::PlaceCommand do
	let(:robot) { Robot.new }
	let(:width) { 5 }
  let(:height) { 5 }
	let(:table) { Table.new(width, height) }

  describe "#initialze" do
    it "should initialze type and arguments for correct commands" do
      command = Commands::PlaceCommand.new("PLACE", [0,0,"NORTH"])

      expect(command.type).to eq("PLACE")
      expect(command.arguments).to eq [0,0,"NORTH"]
    end
  end

  describe '#execute' do
		it "should place the robot on the table for valid inputs" do
			command = Commands::PlaceCommand.new("PLACE", [0,0,"NORTH"])

	    command.execute(robot, table)

	    expect(robot.x).to eq(0)
	    expect(robot.y).to eq(0)
	    expect(robot.direction).to eq("NORTH")
	  end

	  it "should raise an error when placing the robot outside of the table" do
      command = Commands::PlaceCommand.new("PLACE", [8,0,"NORTH"])
      expect(table).to receive(:valid_position?).with(8, 0).and_return(false)

      expect { command.send(:execute, robot, table) }.to raise_error("Invalid Position")
    end

    it "should raise error when placing the robot with an invalid direction" do
      command = Commands::PlaceCommand.new("PLACE", [0,0,"INVALID_DIRECTION"])

      expect { command.send(:execute, robot, table) }.to raise_error("Invalid Direction")
    end
  end
end