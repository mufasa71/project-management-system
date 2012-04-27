Given /^I am not authenticated$/ do
  visit '/'
  click_link 'Sign out'
end

When /^I go to (.+)$/ do |page_name|
  visit path_to page_name
end

Given /^a user exists with email: "([^"]*)", password: "([^"]*)"$/ do |email, password|
  @me ||= FactoryGirl.create(:user, email: email, password: password)
end

Given /^a user exists with email: "([^"]*)", password: "([^"]*)", username: "([^"]*)"$/ do |email, password, username|
  @me ||= FactoryGirl.create(:user, email: email, password: password)
  @me.profile.update_attributes(username: username, skype: "skype")
  @me.save!
end

Given /^the following users exists$/ do |expected_table|
  # table is a Cucumber::Ast::Table
  users = expected_table.hashes
  users.each do |user_attrs|
    FactoryGirl.create(:user, user_attrs)
  end
end   

Given /^I am signed in as (.+)$/ do |type|
  step %(I try to sign in as #{type})
end

Given /^I try to sign in as admin$/ do
  password = "abcdefr"
  @admin ||= FactoryGirl.create(:admin, password: password)
  steps %Q{
    When I go to the new user session page
    And I fill in "user_email" with "#{@admin.email}"
    And I fill in "user_password" with "#{password}"
    And I press "Sign in"
  }
  find_link("#{@admin.email}")
end

Given /^I try to sign in as user$/ do
  password = "abcdef2"
  @me ||= FactoryGirl.create(:user, password: password)
  steps %Q{
    When I go to the new user session page
    And I fill in "user_email" with "#{@me.email}"
    And I fill in "user_password" with "#{password}"
    And I press "Sign in"
  }
  find_link("#{@me.email}")
end

Given /^I already update profile$/ do
  steps %Q{
    When I go to my edit profile page
    And I fill in "Username" with "Shukhrat Mukimov"
    When I press "Update Profile"
    Then I should see "Profile was successfully updated."
  }
end
