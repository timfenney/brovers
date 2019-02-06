require_relative '../../app/lib/builder'
require_relative '../../app/lib/rover'

describe Builder do
  it 'builds a rover' do
    rover = Builder.build_rover(data: ['1', '2', 'N'])
    expect(rover.kind_of? Rover).to be(true)
  end

  it 'builds a plateau' do
    plateau = Builder.build_plateau(data: ['7', '8'])
    expect(plateau.kind_of? Plateau).to be(true)
  end
end
