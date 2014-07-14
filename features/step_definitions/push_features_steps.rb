#Setup
Given /^I don't have a \.wally authorisation file$/ do
end

Given /^I have a \.wally authentication file$/ do
  @authentication_code = "authCodE!!2322"
  write_file('.wally', @authentication_code)
end

feature = <<-SQL.gsub(/^\s+\|/,'')
  |Feature: Some Feature Name
  |
  |  Scenario: Whatever
  |    Given I do something
  |    Then it happens
SQL

Given /^I have a project called "([^"]*)"$/ do |project_name|
  step "I have a .wally authentication file"
  step %Q%I upload features for "#{project_name}"%
  remove_file ".wally" rescue Errno::ENOENT
end

# Actually test our client
When /^I upload features for "([^"]*)"$/ do |project_name|
  write_file('example-features/some_feature.feature', feature)
  run_simple("wally push http://#{WallyHost.url}/projects/#{project_name} example-features/", false)
end

When /^I delete the project called "([^"]*)"$/ do |project_name|
  run_simple("wally destroy http://#{WallyHost.url}/projects/#{project_name}", false)
end

# Assertions
Then /^"([^"]*)" should exist$/ do |project_name|
  @output = Net::HTTP.get(URI.parse "http://#{WallyHost.url}/projects/#{project_name}")
  expect(@output).to have_content project_name
end

Then /^"([^"]*)" should not exist$/ do |project_name|
  @output = Net::HTTP.get(URI.parse "http://#{WallyHost.url}/projects/#{project_name}")
  expect(@output).to_not have_content project_name
end

Then /^I should see the uploaded features$/ do
  expect(@output).to have_content "Feature Name"
end
