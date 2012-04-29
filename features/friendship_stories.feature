Feature: Following and being followed
  As a user
  I want to be friend with Bob

  Background: 
    Given a user exists with email: "rayn@mail.com"
    And I am logged in as that user
    And a user exists

  Scenario: Following Bob
    Given I go to the user's page
    When I press "Add to friends"
    Then I should see "Friend request was successfully sended."

  Scenario: Hide friend request from Bob's page
    Given I go to the user's page
    When I press "Add to friends"
    Then I should see "Friendship status in progress"
