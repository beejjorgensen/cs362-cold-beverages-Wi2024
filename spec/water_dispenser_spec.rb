require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a water reservoir' do
    water_dispenser = WaterDispenser.new
    expect(water_dispenser.reservoir).to be_a(WaterReservoir)
  end

  it 'dispenses water' do
    water_dispenser = WaterDispenser.new
    vessel = Vessel.new
    expect(water_dispenser.dispense(vessel)).to eq('Water dispensed!')
  end

end
