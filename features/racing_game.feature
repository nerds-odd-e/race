# race_game.feature
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

  Scenario: start a game
    Given the organizer created a game
    When a player join the game
    Then the player's car should be at the beginning line with 0 damage
    When another player join the game
    Then there should be two cars at the beginning line

  Scenario: from the player's view
    Given a player is in the game (he)
      And another player is in the game (she)
     Then he should not be able to move
     When the organizer starts a new tick
     Then he can make a move
      And he should not be able to move again
      And she can make a move
     When the organizer starts a new tick
     Then he can make a move again

  Scenario Outline: play a tick
    Given a player's car has existing number of <damages> scars
    When the organizer starts a new tick
    Then he should be asked to choose if he want to go 'normal' or 'super'
    When he makes a <choice> and the dice show <number>
    Then his car should go <steps> with <expected damages> on it

    Examples: Player chose 'normal' and played odd numbers
      | damages | choice  | number | steps | expected damages |
      |      0  | normal  |    1   |  1    |           0      |
      |      0  | normal  |    3   |  1    |           0      |
      |      0  | normal  |    5   |  1    |           0      |
      |      1  | normal  |    1   |  0    |           1      |
      |      2  | normal  |    1   |  0    |           2      |

    Examples: Player chose 'normal' and played even numbers
      | damages | choice  | number | steps | expected damages |
      |      0  | normal  |    2   |  2    |           0      |
      |      0  | normal  |    4   |  2    |           0      |
      |      0  | normal  |    6   |  2    |           0      |
      |      1  | normal  |    2   |  1    |           1      |

    Examples: Player chose 'super'
      | damages | choice  | number | steps | expected damages |
      |      0  | super   |    1   |  1    |           1      |
      |      0  | super   |    2   |  2    |           1      |
      |      0  | super   |    3   |  3    |           1      |
      |      1  | super   |    1   |  0    |           2      |
      |      1  | super   |    2   |  1    |           2      |

