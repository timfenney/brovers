Feature: Control a Rover
  I want to give a Rover a series of instructions to move from a starting point and orientation

  Scenario: Go North
    Given a Plateau of size 5, 10
    Given a Rover is at 0, 0 and pointed 'N'
    Given the Rover is commanded with 'MMM'
    Then the Rover should be at 0, 3, and pointed 'N'
