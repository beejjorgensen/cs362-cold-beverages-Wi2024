require_relative '../lib/chiller'

describe 'A chiller' do

  let (:chiller) { Chiller.new }

  it 'has a capacity, temperature, power, and contents' do
    expect(chiller).to respond_to(:capacity)
    expect(chiller).to respond_to(:temperature)
    expect(chiller.instance_variable_get(:@power)).to eq(:off)
    expect(chiller.instance_variable_get(:@contents)).to eq([])
  end

  it 'can be turned on' do
    chiller.turn_on
    expect(chiller.instance_variable_get(:@power)).to eq(:on)
  end

  it 'can be turned off' do
    chiller.turn_off
    expect(chiller.instance_variable_get(:@power)).to eq(:off)
  end

  it 'can add an item' do
    item = Item.new("Item", 1)
    chiller.add(item)
    expect(chiller.instance_variable_get(:@contents)).to contain_exactly(item)
  end

  it "knows it's remaining capacity" do
    item = Item.new("Item", 10)
    chiller.add(item)

    expect(chiller.remaining_capacity).to eq(100 - 10)  # chiller capacity - item volume
  end

  it "can set it's level" do
    chiller.set_level(5)
    expect(chiller.temperature).to eq(45)  # level*5 less than room temp (70)
  end

end
