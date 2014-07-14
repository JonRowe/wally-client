Feature: Push Features To Server
  In order to easily get features on the server
  As a developer
  I want to be able to push features to an endpoint

  Scenario: Push features without authentication
    Given I don't have a .wally authorisation file
    When I upload features for "my_project_name"
    Then "my_project_name" should not exist

  Scenario: Push features with authentication
    Given I have a .wally authentication file
    When I upload features for "project1"
    Then "project1" should exist
    And I should see the uploaded features

  Scenario: Delete projects without authorisation
    Given I have a project called "project1"
    And I don't have a .wally authorisation file
    When I delete the project called "project1"
    Then "project1" should exist

  Scenario: Delete projects with authorisation
    Given I have a project called "project1"
    And I have a .wally authentication file
    When I delete the project called "project1"
    Then "project1" should not exist
