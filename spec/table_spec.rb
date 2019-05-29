require "spec_helper"
require "table"

describe Table do

  let(:table)   { Table.new(5,5) }

  describe "Default table" do
    it "should define a table" do
      expect(table.instance_variable_get(:@width)).to eq 5
      expect(table.instance_variable_get(:@height)).to eq 5
    end
  end

  describe "#valid_position?" do
    it "shold return true when x,y both are 0" do
      expect(table.valid_position?(0, 0)).to be_truthy
    end

    it "should return false when x is less than 0" do
      expect(table.valid_position?(-1, 0)).to be_falsy
    end

    it "should return false when y is less than 0" do
      expect(table.valid_position?(0, -1)).to be_falsy
    end

    it "should return true when x and y are equal to table width and height" do
      expect(table.valid_position?(5,5)).to be_truthy
    end

    it "should return false when x is greater than table width" do
      expect(table.valid_position?(6, 0)).to be_falsy
    end

    it "should return false when y is greater than table height" do
      expect(table.valid_position?(0, 6)).to be_falsy
    end

    it "should return true when x,y are within the table width and height" do
      expect(table.valid_position?(4, 3)).to be_truthy
    end
  end
end