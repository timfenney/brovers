require_relative '../../app/lib/plateau'

describe Plateau do
  it 'can be built' do
    plateau = Plateau.new(x_size: 1, y_size: 2)
  end
end
