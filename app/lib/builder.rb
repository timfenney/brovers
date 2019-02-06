# Class Builder
#
# I probably won't get to finish everything I want to do here.
# The main justification is that in general, I don't like strings
# and other random data flying around the system. What does 'N'
# mean, for example? Proper names, constants, and transparent
# values are preferrable to me.
# A plan going forward is to have no values like 'N' floating around.
# A precondition for that is to have a place where 'N' is translated
# into some other constant that Rover understands, such as NORTH.
# That place is here, because e.g. Rover shouldn't be coupled to
# whatever IO format is used to indicate compass directions.
# Also, a Rover's job is not to understand the positional data as
# given in the input file.

require_relative './vector_2d'
require_relative './rover'
require_relative './plateau'

class Builder
  def self.build_rover(data:)
    x_str, y_str, direction_str = data
    x = x_str.to_i
    y = y_str.to_i
    location = Vector2d.new(x: x, y: y)
    Rover.new(location: location, direction: direction_str)
  end

  def self.build_plateau(data:)
    x_size_str, y_size_str = data
    x_size = x_size_str.to_i
    y_size = y_size_str.to_i
    Plateau.new(x_size: x_size, y_size: y_size)
  end
  
end

