require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    before do 
        chiller = Chiller.new 
        freezer= Freezer.new 
        water_reservoir= WaterReservoir.new
        water_dispenser=WaterDispenser.new(water_reservoir)
        
        @refrigerator = Refrigerator.new(chiller,freezer,water_dispenser,water_reservoir)
    end 
       
    it 'has a chiller ,freezer ,water dispencer , water reservoir' do
       
        expect(@refrigerator.freezer.capacity).to eq(100)
        expect(@refrigerator.freezer.temperature).to eq(70)
        expect(@refrigerator.freezer.power).to eq(:off)
        expect(@refrigerator.freezer.contents).to eq([])

    end

    it 'can chill ' do
        
        item =Item.new
       
        @refrigerator.chill(item)
  
        expect(@refrigerator.chiller.contents).to_not  eq([])
    end
    it 'can freez' do
       
        item =Item.new

        @refrigerator.freeze(item)
      
        expect(@refrigerator.freezer.contents).to_not  eq([])
      
    end


    it 'can get total capacity ' do

        expect(@refrigerator.total_capacity).to eq(200)
    end

    it "can have an acurate capacity "do 
   
        item1 =Item.new
        item2 =Item.new

        @refrigerator.freeze(item1)
        @refrigerator.chill(item2)

        expect(@refrigerator.remaining_capacity).to eq(0)
    end
    it "can plug in "do 

        @refrigerator.plug_in
        expect(@refrigerator.freezer.power).to eq(:on)
        expect(@refrigerator.chiller.power).to eq(:on)
    end 

    it "can unplug "do 
    
        @refrigerator.plug_in
        @refrigerator.unplug

        expect(@refrigerator.freezer.power).to eq(:off)
        expect(@refrigerator.chiller.power).to eq(:off)
    end 

    it 'can set_chiller_level ' do 
        @refrigerator.set_chiller_level(2)
        expect(@refrigerator.chiller.temperature).to eq(60)
    end

    it 'can set_freezer_level ' do 
        @refrigerator.set_freezer_level(2)
        expect(@refrigerator.freezer.temperature).to eq(50)
    end
    it "#to_s" do
        
        expect(@refrigerator.to_s).to eq("Power: off\nStorage: 200 of 200 available\nTemps: Chiller is 70, Freezer is 70\nWater: Reservoir has 0 remaining.\n")
    end



end
