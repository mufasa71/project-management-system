Feature: Admin features
  In order to manipulate users
  As an admin
  I want to browse users and see detailed information

  Scenario: Verify that I am admin
    Given I am signed in as admin
    When I go to my account page
    Then I should see "Type: Admin"

  Scenario: Show user
    Given I am signed in as admin
    Given a user exists with email: "mukimov@gmail.com", password: "secrertpass", username: "Shukhrat Mukimov"
    When I go to admin show user page
    Then I should see "mukimov@gmail.com" within "h1"
    And I should see "Shukhrat Mukimov"
    
  Scenario: List users
    Given the following users exists
      | email                | password     |
      | mukimov@gmail.com    | secret_pass  |
      | diamondsax@gmail.com | any_password |
    And I am signed in as admin
    When I go to the admin users page
    Then I should see "mukimov@gmail.com"
    And I should see "diamondsax@gmail.com"

  Scenario: Edit user
    Given a user exists with email: "mukimov@gmail.com", password: "secretpass"
    And I am signed in as admin
    When I go to admin edit user page
    And I fill in "Email" with "diamondsax@gmail.com"
    And I press "Update"
    Then I should see "successfully updated."
    
  @break_point_admin
  Scenario: Destroy user
    Given a user exists with email: "mukimov@gmail.com", password: "secretpass"
    And I am signed in as admin
    When I go to the admin users page
    And I follow "Destroy"
    Then I should see "successfully deleted."


