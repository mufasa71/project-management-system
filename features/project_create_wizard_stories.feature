Feature: Project Wizard

  Background:
    Given a user exists with name: "John Bubble"
    And I am logged in as that user
    And I go to the home page
    And I follow "Projects"
    And I follow "New project"

  Scenario: Go to through steps
    Given a user exist with name: "Michael Kill", email: "sim@sim.net"
    When I fill in "Name" with "My new project"
    And I fill in "Identifier" with "my-new-project"
    And I press "Continue >>"
    Then I should see "Add members"
    When I check "Michael Kill"
    And I press "Continue >>"
    Then I should see "Add groups"
    When I fill in "Title" with "Develop"
    And I press "Continue >>"
    Then I should see "Add roles"
    When I fill in "Name" with "Designers"
    And I press "Continue >>"
    Then I should see "Project was successfully created!"
    When I follow "Settings"
    And I follow "Members"
    Then I should see "John Bubble" within "#members"
    And I should see "Project Leader" within "#members"
    And I should see "Michael Kill" within "#members"
    When I follow "Groups"
    Then I should see "Develop" within "#groups"
    When I follow "Roles"
    Then I should see "Designers" within "#roles"

