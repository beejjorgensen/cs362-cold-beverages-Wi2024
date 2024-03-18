require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    it "has capacity and current water volume" do
        water_reservoir = WaterReservoir.new
        expect(water_reservoir.capacity).to eq(10)
        expect(water_reservoir.current_water_volume).to eq(0)
    end

    it "can be filled" do
        water_reservoir = WaterReservoir.new
        water_reservoir.fill
        expect(water_reservoir.current_water_volume).to eq(water_reservoir.capacity)
    end

    it "can be drained" do
        water_reservoir = WaterReservoir.new(:initial_water_volume => 10)
        water_reservoir.drain(10)
        expect(water_reservoir.current_water_volume).to eq(0)
    end

    it "cannot be less than empty" do
        water_reservoir = WaterReservoir.new
        water_reservoir.drain(water_reservoir.current_water_volume + 1)
        expect(water_reservoir.current_water_volume).to_not eq(-1)
    end
end
