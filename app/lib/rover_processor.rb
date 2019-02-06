# Class RoverProcessor
#
# This is basically a state machine. It should be tested, although I am not
# doing that for now. Effort has been made to eliminate conditionals,
# and I would be happier leaving it untested if conditionals were eliminated
# entirely.
# The class is responsible for deciding when to build or process input
# depending on the state.

require_relative './builder'

class RoverProcessor
  # States
  PLATEAU_INIT = 0
  ROVER_INIT = 1
  ROVER_PROCESS = 2

  NEWLINE = "\n"

  PLATEAU_INIT_NEWLINE = [PLATEAU_INIT, NEWLINE].freeze
  ROVER_INIT_NEWLINE = [ROVER_INIT, NEWLINE].freeze
  ROVER_PROCESS_NEWLINE = [ROVER_PROCESS, NEWLINE].freeze

  NEXT_STATE = {
    PLATEAU_INIT_NEWLINE => ROVER_INIT,
    ROVER_INIT_NEWLINE => ROVER_PROCESS,
    ROVER_PROCESS_NEWLINE => ROVER_INIT
  }.freeze

  PROCESS_CHAR = {
    PLATEAU_INIT => :plateau_init,
    ROVER_INIT => :rover_init,
    ROVER_PROCESS => :rover_process
  }.freeze

  FINALIZE = {
    PLATEAU_INIT => :finalize_plateau,
    ROVER_INIT => :finalize_rover,
    ROVER_PROCESS => :finalize_rover_process
  }.freeze

  def initialize
    @state = PLATEAU_INIT
    @plateau_init_data = []
    @rover_init_data = []
  end

  def process(chunk:)
    chunk.chars.each do |char|
      # if the char is not a newline, process
      # if it is, finalize
      if char == NEWLINE
        finalize = FINALIZE[@state]
        self.send finalize
      else
        process_char = PROCESS_CHAR[@state]
        self.send process_char, char: char
      end
      @state = NEXT_STATE.fetch([@state, char], @state)
    end
  end

  def plateau_init(char:)
    # puts "plateau_init: #{ char }"
    @plateau_init_data << char
  end

  def rover_init(char:)
    # puts "rover_init: #{ char }"
    @rover_init_data << char
  end

  def finalize_plateau
    data = @plateau_init_data.join.split(' ')
    @plateau = Builder.build_plateau(data: data)
    @plateau_init_data = []
  end

  def finalize_rover
    data = @rover_init_data.join.split(' ')
    @rover = Builder.build_rover(data: data)
    @rover_init_data = []
  end

  def finalize_rover_process
    location = @rover.location
    @plateau.register(location: location)
    puts "#{location.x} #{location.y} #{@rover.direction}"
  end

  def rover_process(char:)
    return if char == ' '
    @rover = @rover.run commands: char do |location|
      @plateau.passable? location: location
    end
  end
end

