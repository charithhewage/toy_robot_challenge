require "spec_helper"
require "input_parser"

describe InputParser do
  describe '#parse' do
    let(:parser) { InputParser.new }

    it 'should update object attributes for command line' do
      parser.parse('PLACE 0 , 0 , NORTH')

      expect(parser.instance_variable_get(:@type)).to eq('place')
      expect(parser.instance_variable_get(:@arguments)).to eq(['0', '0', 'NORTH'])
    end

    it 'should remove trailing whitespaces of command line' do
      parser.parse('      PLACE 0 , 0 , NORTH      ')

      expect(parser.instance_variable_get(:@type)).to eq('place')
      expect(parser.instance_variable_get(:@arguments)).to eq(['0', '0', 'NORTH'])
    end

    it 'should read command wihtout arguments' do
      parser.parse(' MOVE ')
      parser.parse(' LEFT ')

      expect(parser.instance_variable_get(:@type)).to eq('left')
      expect(parser.instance_variable_get(:@arguments)).to be_empty
    end
  end
end