require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  it 'dispenses water to vessel from reservoir' do
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)

    vessel = Vessel.new('Cup', 5)
    dispenser.dispense(vessel)
  end
end
