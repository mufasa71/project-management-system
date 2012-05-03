Feature: Projects stories

  Background: Authetication
    Given I logged in
  
  Scenario: Project lists
    Given I go to the home page
    And the following projects exist:
      | name      | identifier |
      | Project 1 | project_1  |
      | Project 2 | project_2  |
    When I follow "Projects"
    Then I should see "Project 1" within "#project_list"
    And I should see "Project 2" within "#project_list"

  Scenario: Create project form
    Given I go to the projects page
    When I follow "New project"
    Then I should see "New project" within "h1"

  Scenario: Create project
    Given I go to the new project page
    And I fill in "Name" with "Project 1"
    And I fill in "Description" with "Simple description"
    And I fill in "Identifier" with "simple_project"
    And I fill in "Homepage" with "http://homepage.com"
    And I check "Public"
    When I press "Create"
    Then I should see "Successful creation."
    
  Scenario: Selecting project
    Given a project exists with name: "Project 1"
    And I go to the projects page
    When I follow "Project 1" within "#project_list"
    Then I should see "Project 1" within "#project"

  Scenario: Editing project
    Given a project exists
    And I go to the project edit page
    When I fill in "Name" with "New name"
    And I fill in "Identifier" with "foobar"
    And I press "Save"
    Then I should see "Successful update."
