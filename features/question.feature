Feature: Question

  Scenario: no questions
    When I am on the homepage
    Then I should see no questions

  Scenario: random question
    Given there is a question
    When I am on the homepage
    Then I should see a random question with 3 answers

  @wip
  Scenario: giving the right answer
    When I go to the question
    And I choose the correct answer
    Then I see that I have answered correctly

  @wip
  Scenario: giving the wrong answer
    When I go to the question
    And I choose a wrong answer
    Then I see that I have made a mistake
