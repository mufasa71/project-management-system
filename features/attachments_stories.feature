Feature: Attachments

  Background:
    Given a user exist
    And I am logged in as that user
    And a project exists for that user

  Scenario: Project file attachment
    When I go to the project attachments page
    Then I should be on the project attachments page
    And I should see "Add file" within "#attachments"
    Given I follow "Add file"
    Then I should be on the project new attachment page
    Given I attach the file "/home/hawk/Pictures/profile.jpg" to "File"
    When I press "Add"
    Then I should see "File was successfully added."
    And I should be on the project attachments page
    And I should see "profile.jpg" within "#attachments"

  Scenario: Remove file attachment
    Given I go to the project new attachment page
    And I attach the file "/home/hawk/Pictures/profile.jpg" to "File"
    And I press "Add"
    When I follow "delete_1"
    Then I should see "File was successfully deleted."
    And I should be on the project attachments page
    And I should not see "profile.jpg" within "#attachments"
    
