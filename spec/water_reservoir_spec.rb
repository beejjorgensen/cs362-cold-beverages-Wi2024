require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    let(:reservoir) { WaterReservoir.new() }

    it 'has a capacity and current water volume' do
        expect(reservoir.capacity).to eq(10)
        expect(reservoir.current_water_volume).to eq(0)
    end

    it 'is initially empty' do
        expect(reservoir).to be_empty
    end

    it 'is no longer empty when we fill it' do
        reservoir.fill
        expect(reservoir).to_not be_empty
    end

    it 'can drain' do
        reservoir.fill
        reservoir.drain(5)
        expect(reservoir.current_water_volume).to eq(5)
    end

    it 'wont allow the water volume to go negative when draining' do
        reservoir.fill
        reservoir.drain(50)
        expect(reservoir.current_water_volume).to eq(0)
    end
end
