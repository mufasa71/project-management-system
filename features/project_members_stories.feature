Feature: Project members
  Successfully add and remove project members and roles

  Background: 
    Given a user exists with email: "user@email.com"
    And I am logged in as that user

  Scenario: View project members
    Given a project exists
    And a member exists with user_id: the user, project_id: the project
    And I go to the project page
    And I follow "Settings"
    When I follow "Members"
    Then I should see "user@email.com" within "#members"

  Scenario: View members roles
    Given I go to the projects page
    And I follow "New project"
    And I fill in "Name" with "Project name"
    And I fill in "Identifier" with "project_name"
    And a role exists with name: "Manager"
    When I press "Create"
    And I follow "Settings"
    And I follow "Members"
    Then I should see "Manager" within "#members"

  Scenario: Edit members roles
    Given I go to the projects page
    And I follow "New project"
    And I fill in "Name" with "Project name"
    And I fill in "Identifier" with "project_name"
    And a role exists with name: "Manager"
    And a role exists with name: "Developer"
    When I press "Create"
    And I follow "Settings"
    And I follow "Members"
    And I follow "Edit" within "#members"
    And I check "Developer"
    And I press "Change"
    Then I should see "Successful updated."
    And I should see "Manager Developer" within "#members"

