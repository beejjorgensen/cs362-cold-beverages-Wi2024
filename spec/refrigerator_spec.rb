require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    before :each do
        @chiller = Chiller.new(100)
        @water_reservoir = WaterReservoir.new(100)
        @water_dispenser = WaterDispenser.new(@water_reservoir)
        @freezer = Freezer.new(100)
        @refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser, @water_reservoir)
    end
    it 'has a chiller, freezer, water dispenser, and water reservoir' do
        expect(@refrigerator.chiller).to eq(@chiller)
        expect(@refrigerator.freezer).to eq(@freezer)
        expect(@refrigerator.water_dispenser).to eq(@water_dispenser)
        expect(@refrigerator.water_reservoir).to eq(@water_reservoir)
    end
end
 