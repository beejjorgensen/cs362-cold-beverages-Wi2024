require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it "accepts reservoir" do
        reservoir = WaterReservoir.new
        water_dispense = WaterDispenser.new(reservoir)
        expect(reservoir).to eq(reservoir)
    end

    it "can dispense from a reservoir and fill a vessel" do
        reservoir = WaterReservoir.new
        water_dispense = WaterDispenser.new(reservoir)
        vessel = Vessel.new
        water_dispense.dispense(vessel)
        expect(vessel).to_not be_empty
        expect(reservoir).to be_empty
    end

end
