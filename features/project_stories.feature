Feature: Projects stories

  Background: Authetication
    Given a user exists with name: "John Smith"
    And I am logged in as that user
  
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
    And I fill in "Due date" with "2012-06-23"
    And I check "Public"
    When I press "Continue >>"
    And I follow "skip this step"
    And I follow "skip this step"
    And I follow "skip this step"
    Then I should see "Project was successfully created!"
    
  Scenario: Editing project
    Given a project exist
    And I go to the project edit page
    When I fill in "Name" with "New name"
    And I fill in "Identifier" with "foobar"
    And I press "Save"
    Then I should see "Successful update."
