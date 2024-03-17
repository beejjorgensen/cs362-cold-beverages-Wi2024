require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it 'has a reservoir' do
        water_dispenser = WaterDispenser.new('resivoir')
        expect(water_dispenser.reservoir).to eq('resivoir')
    end
end
