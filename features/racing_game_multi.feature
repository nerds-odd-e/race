Feature: multi player game

  @developing
  Scenario Outline: check after push [next] button
    Given join <join players> players
    And   thrown <thrown players> players
    And   new <new players> players
    When  Admin press next button
    Then  Moved players number is <moved players>

    Examples: go normal
      | join players | thrown players | new players | moved players |
      | 200          | 200            | 0           | 0             |
      | 200          | 199            | 0           | 199           |
      | 500          | 0              | 0           | 0             |
      | 200          | 0              | 1           | 0             |
      | 200          | 199            | 5           | 0             |
