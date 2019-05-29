require "spec_helper"

describe "Run Toy Robot with valid scripts" do

  #Sample data set 1
	it "should output 0,1,NORTH" do
		file = File.expand_path("../fixtures/sample_data_1.txt", File.dirname(__FILE__))

    execute_external_commands(input_file: file, expected_output: "0,1,NORTH\n")
  end

  #Sample data set 2
	it "should output 0,0,WEST" do
		file = File.expand_path("../fixtures/sample_data_2.txt", File.dirname(__FILE__))

    execute_external_commands(input_file: file, expected_output: "0,0,WEST\n")
  end

  #Sample data set 3
	it "should output 3,3,NORTH" do
		file = File.expand_path("../fixtures/sample_data_3.txt", File.dirname(__FILE__))

    execute_external_commands(input_file: file, expected_output: "3,3,NORTH\n")
  end
end

describe "Run Toy Robot with invalid script" do
	#Sample data set 3
	it "should raise command not found for invalid script" do
		file = File.expand_path("../fixtures/invalid_data.txt", File.dirname(__FILE__))

    execute_external_commands(input_file: file, expected_output: "Command <this> not found\n")
  end
end
