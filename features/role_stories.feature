@role
Feature: Role management
  In order to access roles
  As a user
  I want to do to it easily

  Scenario: Unauthenticated role accessing
    Given a role exists with name: "student"
    When I go to the admin role's edit page
    Then I should be redirected to the sign in page
