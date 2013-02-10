Feature: Adding a movie

  @javascript
  Scenario: Uploading a screenshot
    When I make a new movie entry and upload a screenshot
    Then I will see the screenshot for that movie
