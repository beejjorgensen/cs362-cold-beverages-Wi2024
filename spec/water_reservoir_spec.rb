require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    before :each do
        @water_reservoir = WaterReservoir.new(100)
    end

    it 'has a capacity and current volume' do
        expect(@water_reservoir.capacity).to eq(100)
        expect(@water_reservoir.current_water_volume).to eq(0)
    end

    it 'can be filled' do
        @water_reservoir.fill
        expect(@water_reservoir.current_water_volume).to eq(100)
    end

    it 'can be empty' do
        expect(@water_reservoir).to be_empty
    end

    it 'can be drained' do
        @water_reservoir.fill
        @water_reservoir.drain(20)
        expect(@water_reservoir.current_water_volume).to eq(80)
    end

end
