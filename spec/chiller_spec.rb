require_relative '../lib/chiller'

describe 'A chiller' do

    before :each do
        @chiller = Chiller.new(100)
    end
    it 'has a capacity and temperature' do
        expect(@chiller.capacity).to eq(100)
        expect(@chiller.temperature).to eq(70)
    end

    it 'can be turned on' do
        expect(@chiller.turn_on).to eq(:on)
    end

    it 'can be turned off' do
        expect(@chiller.turn_off).to eq(:off)
    end

    it 'can be filled' do
        expect(@chiller.add('ice')).to eq(['ice'])
    end

    it 'has remaining capacity' do
        item = Item.new('ice', 1)
        @chiller.add(item)
        expect(@chiller.remaining_capacity()).to eq(99)
    end

    it 'can have its temperature set' do
        @chiller.set_level(1)
        expect(@chiller.temperature).to eq(65)
    end

end
