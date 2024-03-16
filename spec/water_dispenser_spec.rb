require_relative '../lib/water_dispenser'

describe 'A water dispenser' do


    it 'exists' do
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
    end

    it 'can dispense water' do
        vessel = Vessel.new('FAKE', 5)
        dispenser = WaterDispenser.new(WaterReservoir.new)

        dispenser.dispense(vessel)
        expect(vessel.current_water_volume).to eq(0)
    end
end
