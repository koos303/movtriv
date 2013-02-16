Feature: Question

  Background: 
    Given there is a question
    And I am on the homepage

  Scenario: giving the right answer
    When I choose the correct answer
    Then I see that I have answered correctly

  Scenario: giving the wrong answer
    When I choose a wrong answer
    Then I see that I have made a mistake
