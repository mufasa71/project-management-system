Feature: Account management
  In order to manipulate the system
  As a user
  I want to have effective account

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to path "/users/sign_up"
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "You have signed up successfully."

    Examples:
        | email           | password   |
        | testing@man.net | secretpass |
        | foo@bar.com     | fr33z3     |

  Scenario: Attempt to edit profile
    Given I am signed in
    When I go to my account page
    And I follow "Do it now!"
    And I fill in "Username" with "Shukhrat Mukimov"
    And I fill in "Skype" with "mukimov"
    When I press "Update"
    Then I should see "Profile was successfully updated."

  @break_point
  Scenario: Hide message to update account
    Given I am signed in
    And I already update profile
    When I go to my account page
    And I should not see "Do it now!"
    But I should see "Edit profile"
