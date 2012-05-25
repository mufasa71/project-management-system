Feature: Roles

  Background:
    Given a user exist
    And I am logged in as that user
    And a project exist
    And I go to the project page
    And a role exist with name: "Designer", project: the project
    And I follow "Settings"
    And I follow "Roles"
  
  Scenario: Add role
    When I follow "Add new role"
    And I fill in "Name" with "Developer"
    And I press "Save"
    Then I should see "Role was successfully created."
    And I should see "Developer" within "#roles"

  Scenario: Delete role
    When I follow "Delete" within "#roles"
    Then I should see "Role was successfully deleted."
    And I should not see "Designer" within "#roles"

  Scenario: Edit role
    When I follow "Edit" within "#roles"
    And I fill in "Name" with "Manager"
    And I press "Update"
    Then I should see "Role was successfully updated."
    And I should see "Manager" within "#roles"

