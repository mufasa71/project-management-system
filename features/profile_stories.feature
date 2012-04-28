@profile
Feature: Profile management
  In order to update profile
  As a user
  I want to update only my profile

  Scenario: Not authenticated profile update
    Given a user exists
    And a profile exists with user: the user
    When I go to the user's profile's edit page
    Then I should be redirected to the sign in page

  Scenario: Not authorized profile update
    Given a user exists
    And I am logged in as that user
    And a unique user exists
    And a profile exists with user: the unique user
    When I go to the user's profile's edit page
    Then I should see "not authorized"
