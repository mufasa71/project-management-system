Feature: Issues management

  Background:
    Given a user exists with name: "John Smith"
    And I am logged in as that user
    And a issue status exists with name: "New"
    And a issue priority exists with name: "Normal"

  Scenario: Creating an issue
    Given a project exists for that user
    And I go to the project's page
    And I follow "New issue"
    When I fill in "Subject" with "Compilation of application"
    And I fill in "Description" with "Sample description"
    And I select "New" from "Status"
    And I select "Normal" from "Priority"
    And I attach the file "/home/hawk/Pictures/profile.jpg" to "File"
    And I fill in "Start date" with "2012-05-11"
    And I fill in "Due date" with "2012-05-20"
    And I fill in "Estimated time" with "45"
    And I select "20%" from "Done"
    And I press "Create"
    Then I should see "Issue was successfully created."

  Scenario: View project issues
    Given a project exists for that user
    And a issue exists with project_id: the project, subject: "New bug", status_id: the issue status, priority_id: the issue priority, author_id: the user
    And I go to the project's page
    When I follow "Issues"
    Then I should see "New bug" within "#issues"
