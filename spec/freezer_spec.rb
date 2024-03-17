require_relative '../lib/freezer'

describe 'A freezer' do
  let(:freezer) { Freezer.new }

  it 'has a capacity, temp, power, and contents' do
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
    expect(freezer.power).to eq(:off)
    expect(freezer.contents).to eq([])
  end

  it 'can be turned on and off' do
    expect(freezer.power).to eq(:off)
    freezer.turn_on
    expect(freezer.power).to eq(:on)
    freezer.turn_off
    expect(freezer.power).to eq(:off)
  end

  it 'can have items added to it' do
    expect(freezer.contents).to eq([])
    freezer.add('ice cream')
    expect(freezer.contents).to eq(['ice cream'])
  end

  it 'can report its remaining capacity' do
    expect(freezer.remaining_capacity).to eq(100)
    ice_cream = Item.new('ice cream', 1)
    freezer.add(ice_cream)
    expect(freezer.remaining_capacity).to eq(99)
  end

  # it 'can have its temperature set' do
  #   expect(freezer.temperature).to eq(70)
  #   freezer.set_level(1)
  #   expect(freezer.temperature).to eq(60)
  # end

end
