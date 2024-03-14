require_relative '../lib/chiller'

describe 'A chiller' do
  it 'turns on and off' do
    chiller = Chiller.new
    expect(chiller.turn_on).to eq(:on)
    expect(chiller.turn_off).to eq(:off)
  end

  it 'can have items added' do
    chiller = Chiller.new()
    expect(chiller.add('ITEM')).to include('ITEM')
  end

  it 'has a default temperature' do
    chiller = Chiller.new()
    expect(chiller.temperature).to eq(70)
  end

  it 'can have its temperature adjusted' do
    chiller = Chiller.new()
    chiller.set_level(5)
    expect(chiller.temperature).to eq(45)
  end

  it 'has a full remaining capacity when empty' do
    chiller = Chiller.new()
    expect(chiller.remaining_capacity).to eq(100)
  end

  it 'has a remaining capacity when not empty' do
    chiller = Chiller.new()
    item = Item.new('FAKE', 20)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(80)
  end
end
