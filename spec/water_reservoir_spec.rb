require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    it 'has capacity and volume' do
        water_res = WaterReservoir.new
        expect(water_res).to respond_to(:capacity)
        expect(water_res).to respond_to(:current_water_volume)
    end

    it 'has initial capacity and volume' do
        water_res = WaterReservoir.new
        expect(water_res.capacity).to eq(10)
        expect(water_res.current_water_volume).to eq(0)
    end 

    it 'has custom capacity and volume' do
        water_res = WaterReservoir.new(35, 2)
        expect(water_res.capacity).to eq(35)
        expect(water_res.current_water_volume).to eq(2)
    end

    it 'is initially empty' do
        water_res = WaterReservoir.new
        expect(water_res).to be_empty
    end

    it 'has been filled' do
        water_res = WaterReservoir.new
        water_res.fill
        expect(water_res).to_not be_empty
    end

    it 'has been drained' do
        water_res = WaterReservoir.new
        water_res.fill
        water_res.drain(water_res.capacity)
        expect(water_res).to be_empty
    end
end
