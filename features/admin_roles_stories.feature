@role
Feature: Role management
  In order to access roles
  As a user
  I want to do to it easily

  Background: Authorization
    Given a admin exists
    And I am logged in as that admin

  Scenario: List of roles
    Given the following roles exist:
      | name      |
      | moderator |
      | student   |
    When I go to the admin roles page
    Then I should see "moderator" within "#roles"
    And I should see "student" within "#roles"

  Scenario: Create role
    Given I go to the admin role's new page
    When I fill in "Name" with "moderator"
    And I press "Create"
    Then I should see "successfully created."

  Scenario: Edit role
    Given a role exists
    When I go to the admin role's edit page
    And I fill in "Name" with "user"
    And I press "Update"
    Then I should see "successfully updated."

  Scenario: Delete role
    Given a role exists
    When I go to the admin roles page
    And I follow "Destroy"
    Then I should see "successfully deleted."
