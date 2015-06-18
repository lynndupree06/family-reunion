When(/^I run the seed task$/) do
end

Given /^a "([^"]*)" with email "(.*)"$/ do |role, email|
  case role
    when /admin/ then
      FactoryGirl.create(:user, {:email => email, :password => 'password'}) # :is_admin => true,
    else
      FactoryGirl.create(:user, {:email => email, :password => 'password'}) #:is_admin => false,
  end
end