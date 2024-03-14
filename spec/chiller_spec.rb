require_relative '../lib/chiller'

describe 'A chiller' do

  it 'has a capacity and current temperature' do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it 'can be turned on' do
    chiller = Chiller.new
    chiller.turn_on
    expect(chiller.power).to eq(:on)
  end
  it 'can be turned off' do
    chiller = Chiller.new
    chiller.turn_off
    expect(chiller.power).to eq(:off)
  end

  it 'has nothing in it when first created' do
    chiller = Chiller.new
    expect(chiller.contents).to be_empty
  end

  it 'can have items added to it' do
    chiller = Chiller.new
    chiller.add('fruit salad, yummy yummy')
    expect(chiller.contents).not_to be_empty
  end

  it 'can have its temperature set' do
    chiller = Chiller.new
    chiller.set_level(3)
    expect(chiller.temperature).to eq(55)
  end

  it 'can report its remaining capacity' do
    chiller = Chiller.new
    expect(chiller).to respond_to(:remaining_capacity)
  end

  it 'can report its remaining capacity correctly' do
    chiller = Chiller.new
    item = Item.new('fruit salad, yummy yummy', 1)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(99)
  end
end

