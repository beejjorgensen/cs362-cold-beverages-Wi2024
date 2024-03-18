require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it "water_dispense accepts reservoir" do
        reservoir = WaterReservoir.new
        water_dispense = WaterDispenser.new(reservoir)
        expect(reservoir).to eq(reservoir)
    end

end
