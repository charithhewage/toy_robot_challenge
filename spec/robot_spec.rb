require 'rspec'
require_relative '../lib/robot'

describe 'Robot' do
  subject { Robot.new }

  describe '#new' do
    it 'creates an instance of Robot' do
      expect(subject).to be_a Robot
    end

    it 'should initialize @table_size' do
    	expect(subject.instance_variable_get(:@table_size)).to eq 6
    end

    it 'should initialize @output' do
    	expect(subject.instance_variable_get(:@output)).to eq STDOUT
    end
  end
end