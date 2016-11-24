Feature: Emerson's car racing game
  Scenario: check first view show page
    Given There is a new game
    When  The player join the game
    Then  View has no dice result

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
#      |  1              | Normal | 1         |  0              | 1              |
#      |  1              | Normal | 3         |  0              | 1              |
      |  0              | Normal | 2         |  2              | 0              |
      |  0              | Normal | 4         |  2              | 0              |
#      |  1              | Normal | 2         |  1              | 1              |
#      |  1              | Normal | 4         |  1              | 1              |
#      |  2              | Normal | 3         |  0              | 2              |
#      |  5              | Normal | 4         |  0              | 5              |

    Examples: go super
      | existing damage | choice |dice number| number of steps | updated damage |
      |  0              | Super  | 3         |  3              | 1              |
      |  0              | Super  | 6         |  6              | 1              |
      |  1              | Super  | 3         |  2              | 2              |
#      |  1              | Super  | 6         |  5              | 2              |
#      |  3              | Super  | 3         |  0              | 4              |
#      |  7              | Super  | 6         |  0              | 8              |
