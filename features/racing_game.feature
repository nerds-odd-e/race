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
    Then  The car distance display <distance>

    Examples: go normal
      | existing damage | choice |dice number| number of steps | updated damage |distance |
      |  0              | Normal | 1         |  1              | 0              | 1       |
      |  0              | Normal | 3         |  1              | 0              | 1       |
      |  1              | Normal | 1         |  0              | 1              | 0       |
      |  1              | Normal | 3         |  0              | 1              | 0       |
      |  0              | Normal | 2         |  2              | 0              | 2       |
      |  0              | Normal | 4         |  2              | 0              | 2       |
      |  1              | Normal | 2         |  1              | 1              | 1       |
      |  1              | Normal | 4         |  1              | 1              | 1       |
      |  2              | Normal | 3         |  0              | 2              | 0       |
      |  5              | Normal | 4         |  0              | 5              | 0       |

    Examples: go super
      | existing damage | choice |dice number| number of steps | updated damage | distance |
      |  0              | Super  | 3         |  3              | 1              | 3        | 
      |  0              | Super  | 6         |  6              | 1              | 6        | 
      |  1              | Super  | 3         |  2              | 2              | 2        | 
      |  1              | Super  | 6         |  5              | 2              | 5        | 
      |  3              | Super  | 3         |  0              | 4              | 0        | 
      |  7              | Super  | 6         |  0              | 8              | 0        | 
