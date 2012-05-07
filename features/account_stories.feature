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
    Then a user should exist with email: "<email>"

    Examples:
        | email           | password   |
        | testing@man.net | secretpass |
        | foo@bar.com     | fr33z3     |

  Scenario: Remove an account
    Given a user exists
    Given I am logged in as that user
    And I go to the edit account page
    When I follow "Cancel my account"
    Then I should see "Bye! Your account was successfully cancelled. We hope to see you again soon."

  Scenario: Following wizard to fill up details
    Given a intake exists with number: "UC3F1110CSE"
    And I go to the sign up page
    And I fill in "user_email" with "tom@johes.ru"
    And I fill in "user_password" with "secret_pass"
    And I fill in "user_password_confirmation" with "secret_pass"
    When I press "Sign up"
    Then I should see "Account details"
    Given I fill in "Name" with "Tom Johes"
    And I fill in "Number" with "TP0211992"
    And I select "UC3F1110CSE" from "Intake"
    When I press "Continue"
    Then I should see "Social links"
    Given I fill in "Skype" with "skypeaccount"
    And I fill in "Facebook" with "http://facebook.com/johes"
    And I fill in "Twitter" with "twit_account"
    And I fill in "MSN" with "jones@msn.com"
    When I press "Update"
    Then I should see "You successfully updated your account"
