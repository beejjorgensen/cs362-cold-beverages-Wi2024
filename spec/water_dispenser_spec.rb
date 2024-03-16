require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    before :each do
        @water_reservoir = WaterReservoir.new(100)
        @water_dispenser = WaterDispenser.new(@water_reservoir)
       
    end

    it 'has a reservoir' do
        expect(@water_dispenser.reservoir).to eq(@water_reservoir)
    end
    it 'dispenses water' do
        vessel = Vessel.new('FAKE', 10)
        @water_reservoir.fill
        @water_dispenser.dispense(vessel)
        expect(@water_dispenser.reservoir.current_water_volume).to eq(90)
    end

    it 'raises an error if the reservoir does not have enough water' do
        vessel = Vessel.new('FAKE', 110)
        expect{@water_dispenser.dispense(vessel)}.to raise_error('Not enough water in the reservoir')
    end

    it 'fills the vessel' do
        vessel = Vessel.new('FAKE', 10)
        @water_reservoir.fill
        @water_dispenser.dispense(vessel)
        expect(vessel.volume).to eq(10)
    end


end
 