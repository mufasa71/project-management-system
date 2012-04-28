@admin
Feature: Admin features
  In order to manipulate users
  As an admin
  I want to browse users and see detailed information

  Scenario: Verify that I am admin
    Given a admin exists
    And a profile exists with user: the admin
    And I am logged in as that admin
    When I go to the edit account page
    Then I should see "Type: Admin"

  Scenario: Show user
    Given a admin exists
    And I am logged in as that admin
    Given a user exists with email: "mukimov@gmail.com"
    When I go to the admin user's page
    Then I should see "mukimov@gmail.com" within "h1"
    
  Scenario: List users
    Given the following users exists
      | email                | password     |
      | mukimov@gmail.com    | secret_pass  |
      | diamondsax@gmail.com | any_password |
    And a admin exists
    And I am logged in as that admin
    When I go to the admin users page
    Then I should see "mukimov@gmail.com"
    And I should see "diamondsax@gmail.com"

  Scenario: Edit user
    Given a user exists
    And a admin exists
    And I am logged in as that admin
    When I go to the admin user's edit page
    And I fill in "Email" with "diamondsax@gmail.com"
    And I press "Update"
    Then I should see "successfully updated."
    
  Scenario: Destroy user
    Given a user exists
    And a admin exists
    And I am logged in as that admin
    When I go to the admin users page
    And I follow "Destroy"
    Then I should see "successfully deleted."
