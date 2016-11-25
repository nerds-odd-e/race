Feature: multi player game

  @developing
  Scenario Outline: check after push [next] button
    Given join <join players> players
    When  Admin press next button
    When  thrown <thrown players> players
    And   new <new players> players
    And  View the big screen
    Then  Moved players number is <moved players>
    And   Total players number is <total players>
    When  Admin press next button
    Then  Moved players number is 0
    And   Total players number is <total players>

    Examples: go normal
      | join players | thrown players | new players | moved players | total players |
      | 2            | 2              | 0           | 2             | 2             |
      | 3            | 2              | 0           | 2             | 3             |
      | 5            | 0              | 0           | 0             | 5             |
      | 2            | 0              | 1           | 0             | 3             |
      | 3            | 2              | 1           | 2             | 4             |

  @developing
  Scenario Outline: All player's cars are shown in big screen
    Given join <join players> players
    When  View the big screen
    Then  All player's cars are shown in big screen

    Examples: shown in big screen
      | join players |
      | 1            |
      | 2            |

  @developing
  Scenario: Player's car moves
    Given There are 2 players in the game
    When the first player throws the dice
    Then the first car is moved
    And the second car is not moved
    When the second player throws the dice
    Then the second car is moved

  @developing
  Scenario: Player's car cannot move twice in one round
    Given There's one player in the game
    When the player throws the dice
    Then the player's car is moved
    When the player throws the dice again
    Then the player's car is not moved
    And there's a message saying "already moved"
    When the admin clicks "next"
    And the player throws the dice again
    Then the player's car is moved

