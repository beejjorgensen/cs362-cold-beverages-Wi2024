require_relative '../lib/water_dispenser'

describe 'A water dispenser' do


    it 'exists ' do 
      vessel = Vessel.new
       
      water_dispenser= WaterDispenser.new( WaterReservoir.new)
    end 
    
    it 'can dispense ' do
       
        vessel = Vessel.new
       
        water_dispenser= WaterDispenser.new( WaterReservoir.new)
        water_dispenser.dispense(vessel)
        expect(vessel.current_volume).to eq(100)
      end
end
