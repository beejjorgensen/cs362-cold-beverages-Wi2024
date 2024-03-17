require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it 'has a resevoir' do
        water_reservoir=WaterReservoir.new
        water_dispenser=WaterDispenser.new(water_reservoir)
        expect(water_dispenser.reservoir).to be(water_reservoir)
    end

    it 'can dispense' do
        water_reservoir=WaterReservoir.new(10,10)
        water_dispenser=WaterDispenser.new(water_reservoir)
        vessel=Vessel.new("Vessel", 5)
        initial_water_level=water_dispenser.reservoir.current_water_volume
        water_dispenser.dispense(vessel)
        expect(initial_water_level-water_dispenser.reservoir.current_water_volume).to eq(5)
    end
end
