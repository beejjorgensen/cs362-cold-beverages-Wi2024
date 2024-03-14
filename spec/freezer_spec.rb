require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
  it 'has a capacity and current temperature' do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it 'can be turned on' do
    freezer = Freezer.new
    freezer.turn_on
    expect(freezer.power).to eq(:on)
  end
  it 'can be turned off' do
    freezer = Freezer.new
    freezer.turn_off
    expect(freezer.power).to eq(:off)
  end

  it 'has nothing in it when first created' do
    freezer = Freezer.new
    expect(freezer.contents).to be_empty
  end

  it 'can have items added to it' do
    freezer = Freezer.new
    freezer.add('fruit salad, yummy yummy')
    expect(freezer.contents).not_to be_empty
  end

  it 'can have its temperature set' do
    freezer = Freezer.new
    freezer.set_level(3)
    expect(freezer.temperature).to eq(40)
  end

  it 'can report its remaining capacity' do
    freezer = Freezer.new
    expect(freezer).to respond_to(:remaining_capacity)
  end

  it 'can report its remaining capacity correctly' do
    freezer = Freezer.new
    item = Item.new('fruit salad, yummy yummy', 1)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(99)
  end
end
