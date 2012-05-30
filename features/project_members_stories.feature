Feature: Project members
  Successfully add and remove project members and roles
  
  Background: 
    Given a user exists with name: "Jakie Lowerens"
    And I am logged in as that user
    And I go to the projects page
    And I follow "New project"
    And I fill in "Name" with "Project name"
    And I fill in "Identifier" with "project_name"
    And I fill in "Due date" with "2012-07-29"
    And I press "Continue >>"
    And I follow "skip this step"
    And I follow "skip this step"
    And I follow "skip this step"
    And I follow "Settings"

  Scenario: View project members
    When I follow "Members"
    Then I should see "Jakie Lowerens" within "#members"

  Scenario: View members roles
    When I follow "Members"
    Then I should see "Project Leader" within "#members"

  Scenario: Edit members roles
    Given I follow "Roles"
    And I follow "Add new role"
    And I fill in "Name" with "Developer"
    And I press "Save"
    When I follow "Members"
    And I follow "Edit" within "#members"
    And I check "Developer"
    And I press "Update"
    Then I should see "Successful updated."
    And I should see "Developer" within "#members"

  Scenario: Edit members group
    Given I follow "Groups"
    And I follow "Add new group"
    And I fill in "Title" with "Develop"
    And I press "Save"
    When I follow "Members"
    And I follow "Edit" within "#members"
    And I select "Develop" from "Group"
    When I press "Update"
    Then I should see "Develop" within "#members"
    And  should see "Successful updated."
  
  Scenario: Add members to project
    Given a unique user exists with name: "Tom Jones"
    When I follow "Members"
    And I follow "Add more members"
    And I check "Tom Jones" within "#add_member"
    And I press "Add members"
    Then I should see "Tom Jones" within "#members"
    And I should see "Successful updated."

  Scenario: Delete members from project
    When I follow "Members"
    And I follow "Delete"
    Then I should not see "Jakie Lowerens" within "#members"
    And I should see "Successful updated."
