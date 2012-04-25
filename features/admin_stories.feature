Feature: Admin features
  In order to manipulate users
  As an admin
  I want to browse users and see detailed information

  Scenario: Verify that I am admin
    Given I am signed in as admin
    When I go to my account page
    Then I should see "Type: Admin"

  @break_point_admin
  Scenario: Show users
    Given a user exists with email: "mukimov@gmail.com", password: "secrertpass", username: "Shukhrat Mukimov"
    When I go to show user page
    Then I should see "mukimov@gmail.com" within "h1"
    And I should see "Shukhrat Mukimov"



