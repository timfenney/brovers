require 'set'

class PositionNotUniqueError < StandardError
end

class Plateau
  def initialize(x_size:, y_size:)
    @x_size = x_size
    @y_size = y_size
    @locations = Set.new
  end

  def passable?(location:)
    if location.x < 0 || location.x >= @x_size || location.y < 0 || location.y >= @y_size
      return false
    end

    return false if @locations.include? location
    
    true
  end

  def register(location:)
    raise PositionNotUniqueError if @locations.include? location
    @locations.add(location)
  end

  def to_s
    "<Plateau x_size=#{@x_size} y_size=#{@y_size}>"
  end

  attr_reader :x_size, :y_size
end
