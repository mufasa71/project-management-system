Feature: Project settings
  Successfully add and remove project settings

  Background:
    Given a user exists with email: "user@email.com"
    And a project exists
    And a member exists with user_id: the user, project_id: the project
    And I am logged in as that user
    And I go to the project page
    And I follow "Settings"

  Scenario: View project settings
    Then I should see "Settings" within "#settings"

  Scenario: View project members
    When I follow "Members" within "#settings"
    Then I should see "user@email.com" within "#members"
