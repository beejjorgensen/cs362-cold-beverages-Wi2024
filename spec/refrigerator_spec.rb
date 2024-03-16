require_relative '../lib/refrigerator'

describe 'A refrigerator' do

    it 'exists' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
    end

    it 'can chill an item' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
        
        item = Item.new('FAKE', 5)
        refrigerator.chill(item)
        expect(refrigerator.chiller.contents).to contain_exactly(item)
      end

      it 'can freeze an item' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
        
        item = Item.new('FAKE', 5)
        refrigerator.freeze(item)
        expect(refrigerator.freezer.contents).to contain_exactly(item)
      end

      it 'can calculate total capacity' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
        
        expect(refrigerator.total_capacity).to eq(chiller.capacity + freezer.capacity)
      end

      it 'can calculate remaining capacity' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
        
        expect(refrigerator.remaining_capacity).to eq(chiller.remaining_capacity + freezer.remaining_capacity)
      end

      it 'can be turned on' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
    
        refrigerator.plug_in
        expect(refrigerator.power).to eq(:on)
        expect(refrigerator.chiller.power).to eq(:on)
        expect(refrigerator.freezer.power).to eq(:on)
      end

      it 'can be turned off' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
    
        refrigerator.unplug
        expect(refrigerator.power).to eq(:off)
        expect(refrigerator.chiller.power).to eq(:off)
        expect(refrigerator.freezer.power).to eq(:off)
      end

      it 'set chiller level' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
    
        refrigerator.set_chiller_level(2)
        expect(refrigerator.chiller.temperature).to eq(60)
      end

      it 'set freezer level' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, reservoir, dispenser)
    
        refrigerator.set_freezer_level(2)
        expect(refrigerator.freezer.temperature).to eq(65)
      end

end
