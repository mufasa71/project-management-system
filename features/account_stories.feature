@account
Feature: Account management
  In order to manipulate the system
  As a user
  I want to have effective account

  Scenario Outline: Creating a new account
    Given I go to the sign up page
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    When I press "Sign up"
    Then I should see "You have signed up successfully."

    Examples:
        | email           | password   |
        | testing@man.net | secretpass |
        | foo@bar.com     | fr33z3     |

  Scenario: Attempt to edit profile
    Given a profile exists
    And a user exists with profile: the profile
    Given I am logged in as that user
    When I go to the user's profile's edit page
    And I fill in "Username" with "Shukhrat Mukimov"
    And I fill in "Skype" with "mukimov"
    When I press "Update"
    Then I should see "Profile was successfully updated."

  Scenario: Remove an account
    Given a user exists
    Given I am logged in as that user
    And I go to the edit account page
    When I follow "Cancel my account"
    Then I should see "Bye! Your account was successfully cancelled. We hope to see you again soon."
