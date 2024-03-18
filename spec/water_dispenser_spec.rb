require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    let(:reservoir) { WaterReservoir.new(100, 100) }
    let(:water_dispenser) { WaterDispenser.new(reservoir) }

    it 'has a reservoir' do
        expect(water_dispenser.reservoir).to eq(reservoir)
    end

    it 'dispenses water from the reservoir' do
        vessel = Vessel.new('FAKE', 100)
        water_dispenser.dispense(vessel)
        expect(reservoir.current_water_volume).to eq(0)
    end
end
