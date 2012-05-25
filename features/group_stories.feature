Feature: Groups

  Background:
    Given a user exist
    And I am logged in as that user
    And a project exist
    And I go to the project page
    And a group exist with title: "Design", project: the project
    And I follow "Settings"
    And I follow "Groups"

  Scenario: Add group
    When I follow "Add new group"
    And I fill in "Title" with "Develop"
    And I press "Save"
    Then I should see "Group was successfully created."
    And I should see "Develop" within "#groups"

  Scenario: Delete group
    When I follow "Delete" within "#groups"
    Then I should see "Group was successfully deleted."
    And I should not see "Design" within "#groups"

  Scenario: Edit group
    When I follow "Edit" within "#groups"
    And I fill in "Title" with "Develop"
    And I press "Update"
    Then I should see "Group was successfully updated."
    And I should see "Develop" within "#groups"

