Feature: Issues management

  Background:
    Given a user exists with name: "John Smith"
    And I am logged in as that user
    And a issue status exists with name: "New"
    And a issue priority exists with name: "Normal"
    And a project exists for that user
    And a issue exists with project: the project, subject: "New bug", status: the issue status, priority: the issue priority, author: the user

  Scenario: Creating an issue
    Given I go to the project's page
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
    And a issue: "issue" should exist with subject: "Compilation of application"
    And I should be on the project issue page

  Scenario: View project issues
    Given I go to the project page
    When I follow "Issues"
    Then I should see "New bug" within "#issues"
    And I should be on the project issues page

  Scenario: Editing issue
    Given I go to the project the issue page
    When I follow "Update"
    And I fill in "Subject" with "New subject"
    And I press "Update"
    Then I should see "Successful updated."
    And I should be on the project issue page

  Scenario: Delete issue
    Given I go to the project the issue page
    When I follow "Delete"
    Then I should see "Successful deleted."
    And I should be on the project page

  Scenario: Selecting assignee for issue
    When I go to the project new issue page
    Then I should see "John Smith" within "#issue_assigned_to_id"

  Scenario: Selecting category
    Given a issue category exists with name: "Web site", project: the project
    When I go to the project new issue page
    Then I should see "Web site" within "#issue_category_id"

  Scenario: Creating issue category
    Given I go to the project new issue page
    When I follow "add_category"
    Then I should be on the project new issue category page
    When I fill in "Name" with "Mocking"
    And I press "Add"
    Then I should see "Category was successfully created."
    And a issue category should exist with project: the project

  Scenario: View issue history
    Given I go to the project the issue page
    When I follow "Update"
    And I fill in "Subject" with "New subject"
    And I press "Update"
    Then I should see "Updated by" within "#history"
    And I should be on the project issue page

