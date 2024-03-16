require_relative '../lib/freezer'

describe 'A freezer' do

    it 'exists' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(85)
        expect(freezer.power).to eq(:off)
        expect(freezer.contents).to be_empty
      end
    
      it 'can be turned on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.power).to eq(:on)
      end
    
      it 'can be turned off' do
        freezer = Freezer.new
        freezer.turn_off
        expect(freezer.power).to eq(:off)
      end
    
      it 'items can be added to it' do
        item = Item.new('FAKE', 5)
        freezer = Freezer.new
        freezer.add(item)
        expect(freezer.contents).to match_array(item)
      end
    
      it 'can calculate remaining capacity' do
        item = Item.new('FAKE', 5)
        freezer = Freezer.new
        freezer.add(item)
        expect(freezer.remaining_capacity).to eq(95)
      end
    
      it 'set temperature level' do
        freezer = Freezer.new
        freezer.set_level(2)
        expect(freezer.temperature).to eq(65)
      end

end
