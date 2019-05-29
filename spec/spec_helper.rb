require 'open3'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  #Running external commands with Open3
  #https://makandracards.com/makandra/44452-running-external-commands-with-open3
  def execute_external_commands(input_file:, expected_output:)
    stdout, stderr, status = Open3.capture3('ruby','./bin/toy_robot.rb', input_file)

    expect(status.exitstatus).to eq(0)
    expect(stdout).to eq(expected_output)
    expect(stderr).to be_empty
  end
end
