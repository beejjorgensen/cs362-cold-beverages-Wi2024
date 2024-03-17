require_relative '../lib/refrigerator'

describe 'A refrigerator' do

  let (:chiller) { Chiller.new }
  let (:freezer) { Freezer.new }
  let (:reservoir) { WaterReservoir.new }
  let (:dispenser) { WaterDispenser.new(reservoir) }

  let (:fridge) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it 'has a chiller, freezer, control panel, water dispenser, and water reservoir' do
    expect(fridge).to respond_to(:chiller)
    expect(fridge).to respond_to(:freezer)
    expect(fridge).to respond_to(:control_panel)
    expect(fridge).to respond_to(:water_dispenser)
    expect(fridge).to respond_to(:water_reservoir)
  end

  it 'can add an item to the chiller' do
    item = Item.new("Item", 1)
    fridge.chill(item)

    expect(fridge.chiller.remaining_capacity).to eq(100 - 1)  # Chiller capacity - item volume
  end

  it 'can add an item to the freezer' do
    item = Item.new("Item", 1)
    fridge.freeze(item)

    expect(fridge.freezer.remaining_capacity).to eq(100 - 1)  # Freezer capacity - item volume
  end

end
