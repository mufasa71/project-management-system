Feature: Issues management

  Background:
    Given a user exists with name: "John Smith"
    And I am logged in as that user

  Scenario: Creating an issue
    Given a project exists for that user
    And I go to the project's page
    And I follow "New issue"
    When I fill in "Subject" with "Compilation of application"
    And I fill in "Description" with "Sample description"
    And I select "New" from "Status"
    And I select "Normal" from "Priority"
    And I select "Web site" from "Category"
    And I select "Basic" from "Target vesrion"
    And I attach the file "file" to "Files"
    And I check "Mac North"
    And I fill in "Start date" with "2012-05-11"
    And I fill in "Due date" with "2012-05-20"
    And I fill in "Estimated time" with "45"
    And I select "20%" from "% Done"
    And I press "Create"
    Then I should see "Successful created."
