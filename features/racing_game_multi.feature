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
      | 2            | 2              | 0           | 0             |
#      | 3            | 2              | 0           | 2             |
#      | 5          | 0              | 0           | 0             |
#      | 2          | 0              | 1           | 0             |
#      | 3          | 2            | 1           | 0             |
