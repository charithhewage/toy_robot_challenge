require "spec_helper"
require "robot"

describe Robot do
  let(:robot) { Robot.new }

  describe "#update_position" do
    it 'should update the position for given directions ' do
      robot.update_position(1, 2, 'NORTH')

      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.direction).to eq('NORTH')
    end
  end

  describe "#placed?" do
    it "sould return false when x is nil" do
      robot.update_position(nil,0,"north")
      expect(robot.placed?).to be_falsy
    end

    it "sould return false when y is nil" do
      robot.update_position(0,nil,"SOUTH")
      expect(robot.placed?).to be_falsy
    end

    it "should return false when direction is nil" do
      robot.update_position(0,0,nil)
      expect(robot.placed?).to be_falsy
    end

    it "should return true when x,y and direction all are not nil" do
      robot.update_position(0,0,'WEST')
      expect(robot.placed?).to be_truthy
    end
  end
end