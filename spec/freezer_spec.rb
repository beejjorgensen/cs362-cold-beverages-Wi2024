require_relative '../lib/freezer'

describe 'A freezer' do
  it 'turns on and off' do
    freezer = Freezer.new
    expect(freezer.turn_on).to eq(:on)
    expect(freezer.turn_off).to eq(:off)
  end

  it 'can have items added' do
    freezer = Freezer.new()
    expect(freezer.add('ITEM')).to include('ITEM')
  end

  it 'has a default temperature' do
    freezer = Freezer.new()
    expect(freezer.temperature).to eq(70)
  end

  it 'can have its temperature adjusted' do
    freezer = Freezer.new()
    freezer.set_level(5)
    expect(freezer.temperature).to eq(20)
  end

  it 'has a full remaining capacity when empty' do
    freezer = Freezer.new()
    expect(freezer.remaining_capacity).to eq(100)
  end

  it 'has a remaining capacity when not empty' do
    freezer = Freezer.new()
    item = Item.new('FAKE', 20)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(80)
  end
end
