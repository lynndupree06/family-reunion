Feature:
  As a User
  I want to be able to register for the Family Reunion
  So that I can reserve my spot

  Background:
    When I run the seed task
    Then the following users exist
      | Email                     | Role      |
      | john.smith@test.com       |           |

  Scenario:
    Given I am logged in as "john.smith@test.com"
    When I click on the "Registration" link
    And I fill in the following registration details
      | Field           | Value |
      | num_of_rooms    | 1     |
    Then I submit my registration
