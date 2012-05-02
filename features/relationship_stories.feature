Feature: Following and being followed
  As a user
  I want to follow and unfollow Bob

  Background: 
    Given a user exists with email: "rayn@mail.com"
    And I am logged in as that user
    And a user exists with email: "bob@marley.com"

  Scenario: Following and unfollowing Bob
    Given I go to the user's page
    When I press "Follow"
    Then I should see "You are now following bob@marley.com"
    When I press "Unfollow"
    Then I should see "You successfully unfollowed bob@marley.com"
