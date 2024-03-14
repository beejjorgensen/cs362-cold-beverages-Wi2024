require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  it 'has a name and volume' do
    vessel = Vessel.new
    expect(vessel.name).to eq('FAKE')
    expect(vessel.volume).to eq(100)
  end

  it 'dispenes the correct amount of water into a vessel' do
    reservoir = WaterReservoir.new(100, 0)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Fake', 10)
    reservoir.fill
    dispenser.dispense(vessel)
    expect(reservoir.current_water_volume).to eq(90)
  end

  it 'should be empty after dispensing all of its water' do
    reservoir = WaterReservoir.new(100, 0)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Fake', 100)
    reservoir.fill
    dispenser.dispense(vessel)
    expect(reservoir).to be_empty
  end

  it 'should fill vessel' do
    water_dispenser = WaterDispenser.new(WaterReservoir.new(100, 0))
    vessel = Vessel.new('Fake', 100)
    expect(vessel).to_not be_full
    water_dispenser.fill(vessel)
    expect(vessel).to be_full
  end
end
