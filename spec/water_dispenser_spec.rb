require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a water reservoir' do
    water_dispenser = WaterDispenser.new
    expect(water_dispenser.reservoir).to be_a(WaterReservoir)
  end

  it 'dispenses water' do
    water_reservoir = WaterReservoir.new(200, 150)
    water_dispenser = WaterDispenser.new(water_reservoir)
    vessel = Vessel.new('cup', 100)
    expect(water_dispenser.dispense(vessel)).to eq(50)
  end

  it 'fills the vessel' do
    water_reservoir = WaterReservoir.new(200, 150)
    water_dispenser = WaterDispenser.new(water_reservoir)
    vessel = Vessel.new('cup', 100)
    water_dispenser.dispense(vessel)
    expect(vessel.empty?).to be(false)
  end

end
