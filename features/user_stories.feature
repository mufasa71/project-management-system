Feature: Users stories
  In order to manage my account
  As a user
  I want to do it easily

  Background:
    Given a user exists
    And I am logged in as that user

  Scenario: Attempts to see lists of users
    When I go to the admin users page
    Then I should see "You are not authorized to access this page."

  Scenario: Attempts to manipulate restricted accounts
    When I go to admin user's edit page
    Then I should see "You are not authorized to access this page."

  Scenario: View "View details" link
    When I go to the edit user registration page
    Then "View details" should link to "the user details page"

  Scenario: Edit details
    When I go to the user's edit page
    And I fill in "Name" with "Tom Sam"
    And I fill in "Skype" with "tom_skype"
    And I press "Update"
    Then I should see "Details successful updated."
    And I should be on the user details page

  Scenario: View details
    When I go to the user's details page
    Then I should see "Account details"
    
  Scenario: View "Edit details" link
    When I go to the user's details page
    Then "Edit details" should link to "the user's edit page"
