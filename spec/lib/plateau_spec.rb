require_relative '../../app/lib/plateau.rb'
require_relative '../../app/lib/vector_2d.rb'

describe Plateau do
  context 'the plateau is large' do
    before do
      @plateau = Plateau.new(x_size: 100, y_size: 101)
      @location1 = Vector2d.new(x: 5, y: 6)
      @location2 = Vector2d.new(x: 5, y: 5)
    end

    it 'reports interior coordinates as passable' do
      expect(@plateau.passable?(location: Vector2d.new(x: 99, y: 0))).to be(true)
    end

    it 'reports negative x coordinates as not passable' do
      expect(@plateau.passable?(location: Vector2d.new(x: -1, y: 0))).to be(false)
    end
    
    it 'reports x coordinates greater than plateau x as not passable' do
      expect(@plateau.passable?(location: Vector2d.new(x: 105, y: 0))).to be(false)
    end

    it 'reports x coordinates equal to plateau x as not passable' do
      expect(@plateau.passable?(location: Vector2d.new(x: 100, y: 0))).to be(false)
    end

    it 'reports negative y coordinates as not passable' do
      expect(@plateau.passable?(location: Vector2d.new(x: 0, y: -1))).to be(false)
    end

    it 'reports y coordinates greater than plateau y as not passable' do
      expect(@plateau.passable?(location: Vector2d.new(x: 0, y: 105))).to be(false)
    end

    it 'reports y coordinates equal to plateau y as not passable' do
      expect(@plateau.passable?(location: Vector2d.new(x: 0, y: 101))).to be(false)
    end

    it 'reports its x dimension size' do
      expect(@plateau.x_size).to eq(100)
    end

    it 'reports the coordinates of a registered location as not passable' do
      @plateau.register(location: @location1)
      expect(@plateau.passable?(location: @location1)).to be(false)
    end

    context 'registering locations' do
      it 'registers a single location' do
        @plateau.register(location: @location1)
      end

      it 'registers a second location with unique coordinates' do
        @plateau.register(location: @location1)
        expect{@plateau.register(location: @location2)}.not_to raise_error
      end

      it 'does not register a second location with the same coordinates' do
        @plateau.register(location: @location1)
        expect{@plateau.register(location: @location1)}.to raise_error(PositionNotUniqueError)
      end
    end
  end
end


















