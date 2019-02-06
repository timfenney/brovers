require_relative '../../app/lib/rover.rb'
require_relative '../../app/lib/vector_2d.rb'

describe Rover do
  it 'can be built' do
    location = Vector2d.new(x: 1, y: 2)
    rover = Rover.new(location: location, direction: 'N')
  end
end
