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
