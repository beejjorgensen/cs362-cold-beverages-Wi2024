require_relative '../lib/water_reservoir'

describe 'A water reservoir' do


    it 'has a capacity  and initial_water_volume' do
        water_reservoir = WaterReservoir.new
        expect(water_reservoir.capacity).to eq(10)
        expect(water_reservoir.current_water_volume).to eq(0)
      end
    
      it 'is initially empty' do
       
        water_reservoir = WaterReservoir.new
        expect(water_reservoir).to be_empty
      end

      it 'can fill' do 
        water_reservoir = WaterReservoir.new
        water_reservoir.fill
        expect(water_reservoir.current_water_volume).to eq(10)

      end 
    
      it 'can dispense' do
      
        water_reservoir = WaterReservoir.new
        water_reservoir.fill
        water_reservoir.drain(5)
        expect(water_reservoir.current_water_volume).to eq(5)
    
    end
    


end
