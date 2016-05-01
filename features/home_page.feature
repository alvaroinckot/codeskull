Feature: Home page

  Scenario: Viewing application's home pages
    When I am on the homepage
    Then I should see the "login" button
    And I should see "register_courses"
    And I should see "learn_for_free"