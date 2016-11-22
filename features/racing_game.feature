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

  Scenario: check step and damage(normal odd number)
    Given There is a new game
    And   The player join the game
    When  The player goes normal
    And   The dice show 1
    Then  The car move 1 steps and has 0 damage

  Scenario: check step and damage(normal odd number)
    Given There is a new game
    And   The player join the game
    When  The player goes normal
    And   The dice show 3
    Then  The car move 1 steps and has 0 damage

  Scenario: check step and damage(normal odd number damage)
    Given The player has 1 damage
    And   The player joined the game
    When  The player goes normal
    And   The dice show 1
    Then  The car move 0 steps and has 1 damage

  Scenario: check step and damage(normal odd number damage)
    Given The player has 1 damage
    And   The player joined the game
    When  The player goes normal
    And   The dice show 3
    Then  The car move 0 steps and has 1 damage

  Scenario: check step and damage(normal even number)
    Given There is a new game
    And   The player join the game
    When  The player goes normal
    And   The dice show 2
    Then  The car move 2 steps and has 0 damage

  Scenario: check step and damage(normal even number)
    Given There is a new game
    And   The player join the game
    When  The player goes normal
    And   The dice show 4
    Then  The car move 2 steps and has 0 damage

  Scenario: check step and damage(normal even number damage)
    Given The player has 1 damage
    And   The player joined the game
    When  The player goes normal
    And   The dice show 2
    Then  The car move 1 steps and has 1 damage

  Scenario: check step and damage(normal even number damage)
    Given The player has 1 damage
    And   The player joined the game
    When  The player goes normal
    And   The dice show 4
    Then  The car move 1 steps and has 1 damage

  Scenario: check step and damage(normal over available steps)
    Given The player has 2 damage
    And   The player joined the game
    When  The player goes normal
    And   The dice show 3
    Then  The car move 0 steps and has 2 damage

  Scenario: check step and damage(normal over available steps)
    Given The player has 5 damage
    And   The player joined the game
    When  The player goes normal
    And   The dice show 4
    Then  The car move 0 steps and has 5 damage

  Scenario: check step and damage(normal even number)
    Given There is a new game
    And   The player join the game
    When  The player goes normal
    And   The dice show 4
    Then  The car move 2 steps and has 0 damage



  Scenario: check step and damage(super below damage)
    Given There is a new game
    And   The player join the game
    When  The player goes super
    And   The dice show 3
    Then  The car move 3 steps and has 1 damage

  Scenario: check step and damage(super below damage)
    Given There is a new game
    And   The player join the game
    When  The player goes super
    And   The dice show 6
    Then  The car move 6 steps and has 1 damage

  Scenario: check step and damage(super below damage)
    Given The player has 1 damage
    And   The player joined the game
    When  The player goes super
    And   The dice show 3
    Then  The car move 2 steps and has 2 damage

  Scenario: check step and damage(super below damage)
    Given The player has 1 damage
    And   The player joined the game
    When  The player goes super
    And   The dice show 6
    Then  The car move 5 steps and has 2 damage

  Scenario: check step and damage(super below damage)
    Given The player has 3 damage
    And   The player joined the game
    When  The player goes super
    And   The dice show 3
    Then  The car move 0 steps and has 4 damage

  Scenario: check step and damage(super over available damage)
    Given The player has 7 damage
    And   The player joined the game
    When  The player goes super
    And   The dice show 6
    Then  The car move 0 steps and has 8 damage
