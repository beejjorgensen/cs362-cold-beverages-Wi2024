require_relative '../lib/freezer'

describe 'A freezer' do
    before :each do
        @freezer = Freezer.new(100)
    end

    it 'has a capacity, and temperature' do
        expect(@freezer.capacity).to eq(100)
        expect(@freezer.temperature).to eq(70)
    end

    it 'can be turned on' do
        expect(@freezer.turn_on).to eq(:on)
    end

    it 'can be turned off' do
        expect(@freezer.turn_off).to eq(:off)
    end

    it 'can be filled' do
        expect(@freezer.add('ice')).to eq(['ice'])
    end

    it 'has remaining capacity' do
        item = Item.new('ice', 1)
        @freezer.add(item)
        expect(@freezer.remaining_capacity()).to eq(99)
    end

    it 'can have its temperature set' do
        @freezer.set_level(1)
        expect(@freezer.temperature).to eq(60)
    end
end
