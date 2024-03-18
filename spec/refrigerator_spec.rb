require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    before(:each) do
        @reservoir = WaterReservoir.new()
        @dispenser = WaterDispenser.new(@reservoir)
        @freezer = Freezer.new()
        @chiller = Chiller.new()
        @fridge = Refrigerator.new(@chiller, @freezer, @dispenser, @reservoir)
      end
    
      it 'can be plugged in' do
        expect(@fridge.plug_in).to eq(:on)
      end
    
      it 'can be unplugged' do
        expect(@fridge.unplug).to eq(:off)
      end
    
      it 'can set chiller level' do
        expect(@fridge.set_chiller_level(5)).to eq(45)
      end
    
      it 'can set freezer level' do
        expect(@fridge.set_freezer_level(5)).to eq(20)
      end
    
      it 'can get total capacity' do
        expect(@fridge.total_capacity).to eq(200)
      end
    
      it 'can get remaining capacity' do
        expect(@fridge.remaining_capacity).to eq(200)
      end
    
      it 'can add an item to freezer' do
        item = Item.new('FAKE', 20)
        expect(@fridge.freeze(item)).to include(item)
      end
    
      it 'can add an item to chiller' do
        item = Item.new('FAKE', 20)
        expect(@fridge.chill(item)).to include(item)
      end
    
      it 'reports a status' do
        expect(@fridge.to_s).to_not be nil
      end
end