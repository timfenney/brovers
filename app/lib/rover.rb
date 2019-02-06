# Class Rover
#
# This class simulates a rover. It uses FauxO, so doesn't mutate itself, but
# rather returns a new rover for changes.

require_relative './vector_2d'

# Constants

# Commands
M = 'M'.freeze
R = 'R'.freeze
L = 'L'.freeze

# Directions
N = 'N'.freeze
E = 'E'.freeze
S = 'S'.freeze
W = 'W'.freeze

class Rover
  DELTA = {
    N => Vector2d.new(x:  0, y:  1),
    E => Vector2d.new(x:  1, y:  0),
    S => Vector2d.new(x:  0, y: -1),
    W => Vector2d.new(x: -1, y:  0)
  }.freeze

  LEFT = {
    N => W,
    E => N,
    S => E,
    W => S
  }.freeze

  RIGHT = {
    N => E,
    E => S,
    S => W,
    W => N
  }.freeze

  def initialize(location:, direction:)
    @location = location
    @direction = direction
  end

  def run(commands:)
    next_location, next_direction = @location, @direction
    
    commands.chars.each do |command|
      if command == M
        maybe_next_location = next_location
        delta = DELTA[next_direction]
        maybe_next_location += delta
        next_location = maybe_next_location
      elsif command == R || command == L
        turn = command == R ? RIGHT : LEFT
        next_direction = turn[next_direction]
      end
    end
    
    Rover.new(location: next_location, direction: next_direction)
  end

  attr_accessor :location, :direction
end
