Given /^I am not authenticated$/ do
  visit '/'
  click_link 'Sign out'
end
When /^I go to (.+)$/ do |page_name|
  visit path_to page_name
end

Given /^I am logged in as (.+)$/ do |m|
  user = model(m)
  steps %Q{
    When I login with "#{user.email}", "any_password"
    Then I should see "Signed in successfully"
  }
end

Given /^I login with "(\S+)", "(\S+)"$/ do |email, password|
  steps %Q{
    When I go to the sign in page
    And I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{password}"
    And I press "Sign in"
  }
end
