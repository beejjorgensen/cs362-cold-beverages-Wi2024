require_relative '../lib/refrigerator'

describe 'A refrigerator' do

  let (:chiller) { spy(:chiller) }
  let (:freezer) { spy(:freezer) }
  let (:reservoir) { spy(:water_reservoir) }
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

    expect(chiller).to have_received(:add)
  end

  it 'can add an item to the freezer' do
    item = Item.new("Item", 1)
    fridge.freeze(item)

    expect(freezer).to have_received(:add)
  end

  it "knows it's total capacity" do
    allow(chiller).to receive(:capacity).and_return(100)
    allow(freezer).to receive(:capacity).and_return(100)

    expect(fridge.total_capacity).to eq(100 + 100)  # Chiller capacity + freezer capacity
  end

  it "knows it's remaining capacity" do
    item = Item.new("Item", 2)
    fridge.chill(item)
    allow(chiller).to receive(:remaining_capacity).and_return(100 - 2)

    item = Item.new("Item", 3)
    fridge.freeze(item)
    allow(freezer).to receive(:remaining_capacity).and_return(100 - 3)

    expect(fridge.remaining_capacity).to eq(100 + 100 - 2 - 3)  # Chiller capacity + freezer capacity - both item volumes
  end

  it 'can be plugged in' do
    fridge.plug_in

    expect(fridge.instance_variable_get(:@power)).to eq(:on)
    expect(chiller).to have_received(:turn_on)
    expect(freezer).to have_received(:turn_on)
  end

  it 'can be unplugged' do
    fridge.unplug

    expect(fridge.instance_variable_get(:@power)).to eq(:off)
    expect(chiller).to have_received(:turn_off)
    expect(freezer).to have_received(:turn_off)
  end

  it "can set it's chiller's level" do
    fridge.set_chiller_level(5)

    expect(chiller).to have_received(:set_level).with(5)
  end

  it "can set it's freezer's level" do
    fridge.set_freezer_level(5)

    expect(freezer).to have_received(:set_level).with(5)
  end

  it "has a string representation that uses it's power status, remaining storage, temperatures, and remaining water" do
    allow(fridge).to receive(:remaining_capacity)
    allow(fridge).to receive(:total_capacity)

    result = fridge.to_s

    expect(result).to include("off")

    expect(fridge).to have_received(:remaining_capacity)
    expect(fridge).to have_received(:total_capacity)
    expect(chiller).to have_received(:temperature)
    expect(freezer).to have_received(:temperature)
    expect(reservoir).to have_received(:current_water_volume)
  end

end
