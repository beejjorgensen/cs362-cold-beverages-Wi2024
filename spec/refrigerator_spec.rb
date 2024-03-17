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

  it "knows it's total capacity" do
    expect(fridge.total_capacity).to eq(100 + 100)  # Chiller capacity + freezer capacity
  end

  it "knows it's remaining capacity" do
    item = Item.new("Item", 2)
    fridge.chill(item)

    item = Item.new("Item", 3)
    fridge.freeze(item)

    expect(fridge.remaining_capacity).to eq(100 + 100 - 2 - 3)  # Chiller capacity + freezer capacity - both item volumes
  end

  it 'can be plugged in' do
    fridge.plug_in

    expect(fridge.instance_variable_get(:@power)).to eq(:on)
    expect(fridge.chiller.instance_variable_get(:@power)).to eq(:on)
    expect(fridge.freezer.instance_variable_get(:@power)).to eq(:on)
  end

  it 'can be unplugged' do
    fridge.unplug

    expect(fridge.instance_variable_get(:@power)).to eq(:off)
    expect(fridge.chiller.instance_variable_get(:@power)).to eq(:off)
    expect(fridge.freezer.instance_variable_get(:@power)).to eq(:off)
  end

  it "can set it's chiller's level" do
    fridge.set_chiller_level(5)

    expect(fridge.chiller.temperature).to eq(45)  # level*5 less than room temp (70)
  end

  it "can set it's freezer's level" do
    fridge.set_freezer_level(5)

    expect(fridge.freezer.temperature).to eq(20)  # level*10 less than room temp (70)
  end

  it "has a string representation that includes it's power status, remaining storage, temperatures, and remaining water" do
    expect(fridge.to_s).to eq "Power: off\nStorage: 200 of 200 available\nTemps: Chiller is 70, Freezer is 70\nWater: Reservoir has 0 remaining.\n"
  end

end
