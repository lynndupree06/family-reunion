And(/^I fill in my registration details$/) do
  pending
end

Then(/^I submit my registration$/) do
  click_button 'Register'
end

And(/^I fill in the following registration details$/) do |table|
  table.hashes.each do |row|
    step %{fill in "#{row['Field']}" with "#{row['Value']}"}
  end
end
