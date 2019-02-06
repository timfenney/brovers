require_relative '../../app/lib/rover.rb'
require_relative '../../app/lib/vector_2d.rb'

describe Rover do
  context 'the rover faces north' do
    before do
      location = Vector2d.new(x: 1, y: 2)
      @rover = Rover.new(location: location, direction: 'N')
    end

    it 'reports its location' do
      expect(@rover.location).to eq(Vector2d.new(x: 1, y: 2))
    end

    it 'reports its direction' do
      expect(@rover.direction).to eq('N')
    end

    it 'returns a rover moved forward' do
      rover = @rover.run(commands: 'M')
      expect(rover.location).to eq(Vector2d.new(x: 1, y: 3))
    end

    it 'returns a rover turned right' do
      rover = @rover.run(commands: 'R')
      expect(rover.direction).to eq('E')
    end
    
    it 'returns a rover turned left' do
      rover = @rover.run(commands: 'L')
      expect(rover.direction).to eq('W')
    end

    it 'returns a rover for multiple commands' do
      rover = @rover.run(commands: 'LLLMMRM')
      expect([rover.location,
              rover.direction]).to eq([Vector2d.new(x: 3, y: 1), 'S'])
    end
  end

  context 'the rover faces east' do
    before do
      location = Vector2d.new(x: 1, y: 2)
      @rover = Rover.new(location: location, direction: 'E')
    end

    it 'returns a rover moved forward' do
      rover = @rover.run(commands: 'M')
      expect(rover.location).to eq(Vector2d.new(x: 2, y: 2))
    end

    it 'returns a rover turned right' do
      rover = @rover.run(commands: 'R')
      expect(rover.direction).to eq('S')
    end

    it 'returns a rover turned left' do
      rover = @rover.run(commands: 'L')
      expect(rover.direction).to eq('N')
    end
  end
  
  context 'the rover faces south' do
    before do
      @rover = Rover.new(location: Vector2d.new(x: 1, y: 2), direction: 'S')
    end

    it 'returns a rover moved forward' do
      rover = @rover.run(commands: 'M')
      expect(rover.location).to eq(Vector2d.new(x: 1, y: 1))
    end

    it 'returns a rover turned right' do
      rover = @rover.run(commands: 'R')
      expect(rover.direction).to eq('W')
    end

    it 'returns a rover turned left' do
      rover = @rover.run(commands: 'L')
      expect(rover.direction).to eq('E')
    end
  end
  
  context 'the rover faces west' do
    before do
      @rover = Rover.new(location: Vector2d.new(x: 1, y: 2), direction: 'W')
    end

    it 'returns a rover moved forward' do
      rover = @rover.run(commands: 'M')
      expect(rover.location).to eq(Vector2d.new(x: 0, y: 2))
    end

    it 'returns a rover turned right' do
      rover = @rover.run(commands: 'R')
      expect(rover.direction).to eq('N')
    end

    it 'returns a rover turned left' do
      rover = @rover.run(commands: 'L')
      expect(rover.direction).to eq('S')
    end
  end
end
