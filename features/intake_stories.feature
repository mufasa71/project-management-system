Feature: Intakes stories

  Background: 
    Given a admin exist
    And I am logged in as that admin
  
  Scenario: Create intake
    Given I go to the admin_home_index page
    And I follow "Intakes"
    And I follow "New intake"
    And I fill in "Number" with "IntakeNumber"
    When I press "Create Intake"
    Then I should see "Intake was successfully created."

  Scenario: Edit intake
    Given a intake exist
    And I go to the admin_intakes page
    And I follow "Edit"
    When I fill in "Number" with "NewNumber"
    And I press "Update Intake"
    Then I should see "Intake was successfully updated."

  Scenario: Delete intake
    Given a intake exist
    And I go to the admin_intakes page
    When I follow "Delete"
    Then I should see "Intake was successfully deleted."

  Scenario: View intake
    Given a intake exist with number: "IntakeNumber"
    And I go to the admin_intakes page
    When I follow "1"
    Then I should see "IntakeNumber" within "dd"
