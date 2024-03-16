require_relative '../lib/chiller'

describe 'A chiller' do

    it 'has a capacity' do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
        expect(chiller.power).to eq(:off)
        expect(chiller.contents).to be_empty
      end
    
      it 'can be turned on' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.power).to eq(:on)
      end
    
      it 'can be turned off' do
        chiller = Chiller.new
        chiller.turn_off
        expect(chiller.power).to eq(:off)
      end
      
      it 'can add items to it' do
        item = Item.new('FAKE', 5)
        chiller = Chiller.new
        chiller.add(item)
        expect(chiller.contents).to contain_exactly(item)
      end
    
      it 'can calculate remaining capacity' do
        item = Item.new('FAKE', 5)
        chiller = Chiller.new
        chiller.add(item)
        expect(chiller.remaining_capacity).to eq(95)
      end
    
      it 'can set temperature level' do
        chiller = Chiller.new
        chiller.set_level(2)
        expect(chiller.temperature).to eq(60)
      end

end
