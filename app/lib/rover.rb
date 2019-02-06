# Class Rover
#
# This is FauxO programming, OO, except without mutation.
# This implementation is bare in order to allow testing of
# Builder with real collaborators.

class Rover
  def initialize(location:, direction:)
    @location = location
    @direction = direction
  end
end
