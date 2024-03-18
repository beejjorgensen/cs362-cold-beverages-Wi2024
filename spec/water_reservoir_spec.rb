require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    it 'has a capacity and current water volume' do
        reservoir = WaterReservoir.new()
        expect(reservoir.capacity).to eq(10)
        expect(reservoir.current_water_volume).to eq(0)
    end

    it 'is initially empty' do
        reservoir = WaterReservoir.new()
        expect(reservoir).to be_empty
    end

    it 'is no longer empty when we fill it' do
        reservoir = WaterReservoir.new()
        reservoir.fill
        expect(reservoir).to_not be_empty
    end

    it 'can drain' do
        reservoir = WaterReservoir.new()
        reservoir.fill
        reservoir.drain(5)
        expect(reservoir.current_water_volume).to eq(5)
    end
end
