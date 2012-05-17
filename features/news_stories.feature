Feature: News

  Background:
    Given a user exists with name: "John Smith"
    And I am logged in as that user
    And a project exists for that user
    
  Scenario: Go to list of news
    Given I go to the project page
    And the following news exist
      | title       | description         | project     | author   |
      | simple news | another description | the project | the user |
      | my muscle   | description manager | the project | the user |
    When I follow "News"
    Then 2 news should exist with project: the project
    Then I should see "simple news"
    And I should see "my muscle"

  Scenario: Add new news
    Given I go to the project news index page
    And I follow "Add news"
    When I fill in "Title" with "My Title"
    And I fill in "Summary" with "My Summary"
    And I fill in "Description" with "My description"
    And I attach the file "/home/hawk/Pictures/screen.png" to "Attachment"
    And I press "Create"
    Then I should see "News was successfully created."
    And I should be on the project news index page
    And a news should exist with title: "My Title"

  Scenario: Delete news
    Given a news exist with project: the project, author: the user, title: "My title"
    And I go to the project news index page
    When I follow "Delete" within "#news"
    Then I should be on the project news index page
    And I should see "News was successfully deleted."
    And a news should not exist with title: "My title"

  Scenario: Edit news
    Given a news exist with project: the project, author: the user, title: "My title"
    And I go to the project news index page
    When I follow "Edit" within "#news"
    And I fill in "Title" with "New title"
    And I press "Update"
    Then I should see "News was successfully updated."
    And a news should exist with title: "New title"
    And should see "New title"
