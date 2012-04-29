@user
Feature: Users
  In order to manage users
  As a user
  I want to do it easily

  Scenario: Attempts to see lists of users
    Given a user exists
    And I am logged in as that user
    When I go to the admin users page
    Then I should see "You are not authorized to access this page."

  Scenario: Attempts to manipulate restricted accounts
    Given a user exists
    Given I am logged in as that user
    When I go to admin user's edit page
    Then I should see "You are not authorized to access this page."

  Scenario: User page should render edit profile
    Given a profile exists with username: "Mac Donalds"
    And a user exists with profile: the profile
    And I am logged in as that user
    When I go to the edit account page
    Then I should see "Mac Donalds"

  Scenario: User should be able to edit his/her profile
    Given a user with profile exists
    And I am logged in as that user
    When I go to the edit account page
    And I press "Edit profile"
    And I fill in "Username" with "Mac Donalds"
    And I press "Update"
    Then I should see "successfully updated."
