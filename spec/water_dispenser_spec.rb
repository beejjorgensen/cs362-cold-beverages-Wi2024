require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  it 'dispenses water to vessel from reservoir' do
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)

    vessel = Vessel.new('Cup', 3)
    dispenser.dispense(vessel)
    expect(vessel.volume_filled).to eq(3)
    expect(reservoir.current_water_volume).to eq(7)
  end
end
