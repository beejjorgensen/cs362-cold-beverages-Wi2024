require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    it 'initializes' do
        reservoir = WaterReservoir.new
        expect(reservoir.capacity).to eq(10)
        expect(reservoir.current_water_volume).to eq(0)
    end
    
    it 'has a functional empty boolean' do
        reservoir = WaterReservoir.new
        expect(reservoir.empty?).to eq(true)
    end
    
    it 'fills to capacity' do
        reservoir = WaterReservoir.new
        reservoir.fill
        expect(reservoir.current_water_volume).to eq(10)
    end
    
    it 'drains' do
        reservoir = WaterReservoir.new
        reservoir.fill
        reservoir.drain(5)
        expect(reservoir.current_water_volume).to eq(5)
    end
    
    it 'drains to zero' do
        reservoir = WaterReservoir.new
        reservoir.fill
        reservoir.drain(15)
        expect(reservoir.current_water_volume).to eq(0)
    end

end
