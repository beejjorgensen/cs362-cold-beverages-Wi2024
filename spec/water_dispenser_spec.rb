require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/vessel'

describe 'A water dispenser' do
    it "sucessfully initalizes" do
        water_dispenser = WaterDispenser.new(WaterReservoir.new)
        expect(water_dispenser).to be_a(WaterDispenser)

    end
    it "dispenses water" do
        water_dispenser = WaterDispenser.new(WaterReservoir.new(100, 50))
        vessel = Vessel.new('FAKE', 10)
        water_dispenser.dispense(vessel)
        expect(water_dispenser.reservoir.current_water_volume).to eq(40)
    end

    it "fills the reservoir" do
        water_dispenser = WaterDispenser.new(WaterReservoir.new(100, 50))
        water_dispenser.fill
        expect(water_dispenser.reservoir.current_water_volume).to eq(100)
    end

end
