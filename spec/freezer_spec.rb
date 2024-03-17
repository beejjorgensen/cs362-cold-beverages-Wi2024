require_relative '../lib/freezer'

describe 'A freezer' do

  let (:freezer) { Freezer.new }

  it 'has a capacity, temperature, power, and contents' do
    expect(freezer).to respond_to(:capacity)
    expect(freezer).to respond_to(:temperature)
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
    expect(freezer.instance_variable_get(:@contents)).to eq([])
  end

  it 'can be turned on' do
    freezer.turn_on
    expect(freezer.instance_variable_get(:@power)).to eq(:on)
  end

  it 'can be turned off' do
    freezer.turn_off
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
  end

  it 'can add an item' do
    item = Item.new("Item", 1)
    freezer.add(item)
    expect(freezer.instance_variable_get(:@contents)).to contain_exactly(item)
  end

  it "knows it's remaining capacity" do
    item = Item.new("Item", 10)
    freezer.add(item)

    expect(freezer.remaining_capacity).to eq(100 - 10)  # Freezer capacity - item volume
  end

end
