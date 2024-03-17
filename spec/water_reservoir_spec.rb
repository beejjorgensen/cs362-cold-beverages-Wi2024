require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    it 'has a capacity and current water volume' do
        water_reservoir=WaterReservoir.new(10, 10)
        expect(water_reservoir.capacity).to eq(10)
        expect(water_reservoir.current_water_volume).to eq(10)
    end

    it 'is initially empty if unspecified' do
        water_reservoir = WaterReservoir.new
        expect(water_reservoir).to be_empty
    end

    it 'is no longer empty when we fill it' do
        water_reservoir = WaterReservoir.new
        water_reservoir.fill
        expect(water_reservoir).to_not be_empty
    end

    it 'drains by a given volume' do
        water_reservoir = WaterReservoir.new(10, 10)
        water_reservoir.drain(5)
        expect(water_reservoir.current_water_volume).to eq(5)
    end
end
