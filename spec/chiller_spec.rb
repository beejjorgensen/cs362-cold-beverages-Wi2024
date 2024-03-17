require_relative '../lib/chiller'

describe 'A chiller' do
  let(:chiller) { Chiller.new }

  it 'has a capacity, temp, power, and contents' do
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
    expect(chiller.power).to eq(:off)
    expect(chiller.contents).to eq([])
  end

  it 'can be turned on and off' do
    expect(chiller.power).to eq(:off)
    chiller.turn_on
    expect(chiller.power).to eq(:on)
    chiller.turn_off
    expect(chiller.power).to eq(:off)
  end

  it 'can have items added to it' do
    expect(chiller.contents).to eq([])
    chiller.add('soda')
    expect(chiller.contents).to eq(['soda'])
  end

  it 'can report its remaining capacity' do
    expect(chiller.remaining_capacity).to eq(100)
    soda = Item.new('soda', 1)
    chiller.add(soda)
    expect(chiller.remaining_capacity).to eq(99)
  end

  it 'can have its temperature set' do
    expect(chiller.temperature).to eq(70)
    chiller.set_level(1)
    expect(chiller.temperature).to eq(65)
  end

end
