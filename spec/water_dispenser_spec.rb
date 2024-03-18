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

    it 'wont dispense more water than the reservoir has' do
        vessel = Vessel.new('FAKE', 100)
        water_dispenser.dispense(vessel)
        expect(reservoir.current_water_volume).to eq(0)
    end

    it 'will fill the veseel with water' do
        vessel = Vessel.new('FAKE', 100)
        water_dispenser.dispense(vessel)
        expect(vessel).to_not be_empty
    end
end
