require_relative '../../app/lib/vector_2d.rb'
require 'set'

describe Vector2d do
  it 'reports its x coordinate' do
    vec = Vector2d.new(x: 1, y: 2)
    expect(vec.x).to eq(1)
  end

  it 'reports its y coordinate' do
    vec = Vector2d.new(x: 1, y: 2)
    expect(vec.y).to eq(2)
  end

  it 'hashes to the same result for the same arguments' do
    vec1 = Vector2d.new(x: 1, y: 2)
    vec2 = Vector2d.new(x: 1, y: 2)
    expect(vec1.hash == vec2.hash).to be(true)
  end

  it 'hashes to a different result for different x' do
    vec1 = Vector2d.new(x: 1, y: 2)
    vec2 = Vector2d.new(x: -1, y: 2)
    expect(vec1.hash == vec2.hash).to be(false)
  end
  
  it 'hashes to a different result for different y' do
    vec1 = Vector2d.new(x: 1, y: 2)
    vec2 = Vector2d.new(x: 1, y: 24)
    expect(vec1.hash == vec2.hash).to be(false)
  end

  it 'is equal with another of the same arguments' do
    vec1 = Vector2d.new(x: 1, y: 2)
    vec2 = Vector2d.new(x: 1, y: 2)
    expect(vec1.hash == vec2.hash).to be(true)
    expect(vec1.eql?(vec2)).to be(true)
    expect(vec1.equal?(vec2)).to be(true)
  end

  it 'is considered unique in a set' do
    vec1 = Vector2d.new(x: 1, y: 2)
    vec2 = Vector2d.new(x: 1, y: 2)
    set = Set.new
    set.add(vec1)
    set.add(vec2)
    expect(set.length).to be(1)
  end

  it 'can be used in addition to produce a new instance' do
    vec1 = Vector2d.new(x: 1, y: 2)
    vec2 = Vector2d.new(x: 4, y: -1)
    result = vec1 + vec2
    expect(result).not_to eq(vec1)
    expect(result).not_to eq(vec2)
    expect([result.x, result.y]).to eq([5, 1])
  end

  # This is a nice to have, I may not get to it
  xit 'inspects like an ostruct' do
    vec1 = Vector2d.new(x: 1, y: 2)
    result = vec1.inspect
    expect(result).to eq("<Vector2d x=1 y=2>")
  end
end
