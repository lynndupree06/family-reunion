Then(/^the following users exist$/) do |table|
  table.hashes.each do |row|
    step %{a "#{row['Role']}" with email "#{row['Email']}"}
  end
end

Given /^a "([^"]*)" with email "(.*)"$/ do |role, email|
  case role
    when /admin/ then
      Factory.create(:user, {:first_name => 'Some', :last_name => 'User', :email => email, :is_admin => true, :password => 'password'})
    else
      Factory.create(:user, {:first_name => 'Some', :last_name => 'User', :email => email, :is_admin => false, :password => 'password'})
  end
end
