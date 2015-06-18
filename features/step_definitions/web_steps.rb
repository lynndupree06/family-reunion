Then(/^the following users exist$/) do |table|
  table.hashes.each do |row|
    step %{a "#{row['Role']}" with email "#{row['Email']}"}
  end
end


When(/^I navigate to the "([^"]*)" page$/) do |page_name|
  visit path_to(page_name)
end


When(/^I click on the "([^"]*)" link$/) do |link_name|
  click_link link_name
end
