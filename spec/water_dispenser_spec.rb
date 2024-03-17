require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it 'has a reservoir' do
        reservoir = WaterReservoir.new(100)
        water_dispenser = WaterDispenser.new(reservoir)
        expect(water_dispenser.reservoir).to eq(reservoir)
    end

end
