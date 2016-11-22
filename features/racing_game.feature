Feature: Emerson's car racing game
  In one of the Odd-e company gathering, our colleague Emerson Mills
  introduced a game he invented. It's a simple game that is fun to play
  with 3 to 10 people. The game helps people to understand *technical
  debt* and *legacy code* in software development.

  If we made this into an online game, probably we can have more people
  to play together. It might be fun to play in a conference with many
  people and don't forget to provide the final winner a bit of rewards.

  Roles in the game:
    Organizer: Start the game, call for next tick
    Players: In each tick make choice, play the dice and move his/her "car"

  In an offline game, the "car" can be a card, on which you can mark the
  current number of damages. But we sometimes use our phones, and everybody
  remember their number of damages.

  The final should be at least 10 steps from the beginning line.

  Scenario: Start here
    Then 1 + 1 should be 2

#  Scenario: check step and damage(normal odd number)
#    Given There is a new game
#    And   The player join the game
#    When  The player status are
#      |Existing damage|choice|dice|
#      |0              |normal|1   |
#      |0              |normal|3   |
#    Then  The car move 1 steps and has 0 damage

  @developing
  Scenario Outline: check step and damage
    Given There is a new game
    And   The player join the game
    And   The player has <existing damage> damage
    When  The player goes <choice> and the dice show <dice number>
    Then  The car move <number of steps> steps and has <updated damage> damage

    Examples: go normal
      | existing damage | choice |dice number| number of steps | updated damage |
      |  0              | Normal | 1         |  1              | 0              |
      |  0              | Normal | 3         |  1              | 0              |
      |  1              | Normal | 1         |  0              | 1              |
      |  1              | Normal | 3         |  0              | 1              |
      |  0              | Normal | 2         |  2              | 0              |
      |  0              | Normal | 4         |  2              | 0              |
      |  1              | Normal | 2         |  1              | 1              |
      |  1              | Normal | 4         |  1              | 1              |
      |  2              | Normal | 3         |  0              | 2              |
      |  5              | Normal | 4         |  0              | 5              |

    Examples: go super
      | existing damage | choice |dice number| number of steps | updated damage |
      |  0              | Super  | 3         |  3              | 1              |
      |  0              | Super  | 6         |  6              | 1              |
      |  1              | Super  | 3         |  2              | 2              |
      |  1              | Super  | 6         |  5              | 2              |
      |  3              | Super  | 3         |  0              | 4              |
      |  7              | Super  | 6         |  0              | 8              |

