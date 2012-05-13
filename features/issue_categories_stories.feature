Feature: Issue categories

  Background:
    Given a user exists with name: "John McCay"
    And I am logged in as that user
    And a project exists for that user
    And a issue category exists with project: the project
    And I go to the project page
    And I follow "Settings"
    And I follow "Issue categories"
  
  Scenario: Edit category
    Given I follow "Edit" within ".table"
    When I fill in "Name" with "New name"
    And I press "Update"
    Then I should see "Issue category was successfully updated."
  Scenario: Delete category
    When I follow "Delete" within ".table"
    Then I should see "Issue category was successfully deleted."
  Scenario: Create category
    Given I follow "Add"
    And I fill in "Name" with "New category name"
    And I select "John McCay" from "Assigned to"
    When I press "Add"
    Then I should see "Category was successfully created."

