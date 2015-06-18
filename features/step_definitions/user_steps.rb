Given(/^I am logged in as "([^"]*)"$/) do |email|
  visit new_user_session_path
  fill_in("Email", :with => email )
  fill_in("Password", :with => "password" )
  click_button("Sign in")
end
