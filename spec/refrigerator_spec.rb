require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  it 'chills item' do
    chiller = Chiller.new
    freezer = Freezer.new
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    item = Item.new("Test", 5)
    refrigerator.chill(item)
  end

  it 'freezes item' do
    chiller = Chiller.new
    freezer = Freezer.new
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    item = Item.new("Test", 5)
    refrigerator.freeze(item)
  end

  it 'has total capacity' do
    chiller = Chiller.new
    freezer = Freezer.new
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    expect(refrigerator.total_capacity).to eq(chiller.capacity + freezer.capacity)
  end

  it 'has remaining capacity' do
    chiller = Chiller.new
    freezer = Freezer.new
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    item = Item.new("Test", 5)
    refrigerator.freeze(item)
    expect(refrigerator.remaining_capacity).to eq(refrigerator.total_capacity - item.volume)
  end
end
