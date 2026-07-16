Feature: Replay
  later

  Scenario: Go back when move 1 tick
    Given 1 car already went 1 tick with 2 steps
    Then the tick shown is 1
    When the organizer choose to go to the previous tick
    Then the tick shown is 0
    And the car is at 0 step
