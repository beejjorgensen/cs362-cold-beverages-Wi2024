require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it 'has a reservoir' do
        reservoir = WaterReservoir.new(100)
        water_dispenser = WaterDispenser.new(reservoir)
        expect(water_dispenser.reservoir).to eq(reservoir)
    end

    it 'dispenses water from the reservoir' do
        reservoir = WaterReservoir.new(100, 100)
        water_dispenser = WaterDispenser.new(reservoir)
        vessel = Vessel.new('FAKE', 100)
        water_dispenser.dispense(vessel)
        expect(reservoir.current_water_volume).to eq(0)
    end
end
