require_relative '../lib/chiller'

describe 'A chiller' do

    it 'has a capasity ,temp,power , contents' do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
        expect(chiller.power).to eq(:off)
        expect(chiller.contents).to eq([])

    end

    it 'can turn on ' do
        chiller = Chiller.new
        chiller.turn_on
  
        expect(chiller.power).to eq(:on)
    end
    it 'can turn off' do 
        chiller = Chiller.new
        chiller.turn_on
        chiller.turn_off
        expect(chiller.power).to eq(:off)
    end 


    it 'can change temp' do
      
        chiller = Chiller.new
        chiller.set_level(2)

        expect(chiller.temperature).to eq(60)
    end

    it "can add items "do 
        chiller = Chiller.new
        item = Item.new 
        chiller.add(item)
        expect(chiller.contents).to_not eq([])
    end
    it "can chang capacity"do 
        chiller = Chiller.new
        item = Item.new 
        chiller.add(item)
        expect(chiller.capacity).to_not eq(9)
    end 
end
