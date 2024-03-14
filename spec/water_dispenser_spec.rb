require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  it 'has a reservoir' do
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    expect(dispenser.reservoir).to_not be nil
  end

  it 'can dispense' do
    vessel = Vessel.new('FAKE', 100)
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    expect(dispenser.dispense(vessel)).to_not be nil
  end

  it 'dispenses the correct amount into vessel' do
    vessel = Vessel.new('FAKE', 5)
    reservoir = WaterReservoir.new
    reservoir.fill
    dispenser = WaterDispenser.new(reservoir)
    expect(dispenser.dispense(vessel)).to eq(5)
  end

end
