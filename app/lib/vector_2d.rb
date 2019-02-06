class Vector2d
  HASH_CONSTANT = 31
  
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  # This hash algorithm was suggested by Joshua Blosch, and referenced
  # at https://stackoverflow.com/questions/113511/best-implementation-for-hashcode-method-for-a-collection
  def hash
    HASH_CONSTANT * @x.hash * @y.hash
  end

  def eql?(other)
    @x == other.x && @y == other.y
  end

  def equal?(other)
    eql?(other)
  end

  def ==(other)
    eql?(other)
  end

  def +(other)
    Vector2d.new(x: @x + other.x, y: @y + other.y)
  end

  attr_reader :x, :y
end
