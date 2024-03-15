require_relative '../lib/freezer'

describe 'A freezer' do

    
    it 'has a capasity ,temp,power , contents' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(70)
        expect(freezer.power).to eq(:off)
        expect(freezer.contents).to eq([])

    end

    it 'can turn on ' do
        freezer = Freezer.new
        freezer.turn_on
  
        expect(freezer.power).to eq(:on)
    end
    it 'can turn off' do 
        freezer = Freezer.new
        freezer.turn_on
        freezer.turn_off
        expect(freezer.power).to eq(:off)
    end


    it 'can change temp' do
      
        freezer = Freezer.new
        freezer.set_level(2)

        expect(freezer.temperature).to eq(50)
    end

    it "can add items "do 
        freezer = Freezer.new
        item = Item.new 
        freezer.add(item)
        expect(freezer.contents).to_not eq([])
    end
    it "can chang capacity"do 
        freezer = Freezer.new
        item = Item.new 
        freezer.add(item)
        expect(freezer.capacity).to_not eq(9)
    end 
end
