# Class Plateau
#
# This is FauxO programming, OO, except without mutation.
# This implementation is bare in order to allow testing of
# Builder with real collaborators.

class Plateau
  def initialize(x_size:, y_size:)
    @x_size = x_size
    @y_size = y_size
  end
end
