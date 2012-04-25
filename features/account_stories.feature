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
    Given I am signed in as user
    When I go to my account page
    And I follow "Do it now!"
    And I fill in "Username" with "Shukhrat Mukimov"
    And I fill in "Skype" with "mukimov"
    When I press "Update"
    Then I should see "Profile was successfully updated."

  Scenario: Hide message to update account
    Given I am signed in as user
    And I already update profile
    When I go to my account page
    And I should not see "Do it now!"
    But I should see "Edit profile"

  @break_point
  Scenario: Remove an account
    Given I am signed in as user
    And I go to my account page
    When I follow "Cancel my account"
    Then I should see "Bye! Your account was successfully cancelled. We hope to see you again soon."
