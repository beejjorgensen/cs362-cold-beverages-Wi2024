require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
    it 'initalizes' do
        freezer = Freezer.new
        expect(freezer.temperature).to eq(70)
        expect(freezer.capacity).to eq(100)
        expect(freezer.power).to eq(:off)
        expect(freezer.contents).to eq([])
    end

    it 'turns on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.power).to eq(:on)
    end

    it 'turns off' do
        freezer = Freezer.new
        freezer.turn_on
        freezer.turn_off
        expect(freezer.power).to eq(:off)
    end

    it 'adds an item' do
        freezer = Freezer.new
        freezer.add('item')
        expect(freezer.contents).to eq(['item'])
    end



    it 'sets temperature level' do
        freezer = Freezer.new
        freezer.set_level(1)
        expect(freezer.temperature).to eq(60)
    end



end
