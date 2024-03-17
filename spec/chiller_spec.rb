require_relative '../lib/chiller'

describe 'A chiller' do
    let(:chiller) { Chiller.new }
    let(:item) { Item.new("ice cream", 10) }

    it 'has an initial capacity of 100' do
        expect(chiller.capacity).to eq(100)
    end

    it 'has initially empty contents' do
        expect(chiller.remaining_capacity).to eq(chiller.capacity)
    end

    it 'can have an item added to it, lowering the remaining capacity' do
        chiller.add(item)
        expect(chiller.remaining_capacity).to eq(90)
    end

    it 'can be turned on' do
        chiller.turn_on
        expect(chiller.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can be turned off' do
        chiller.turn_off
        expect(chiller.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can have the temperature level changed' do
        level = 2
        chiller.set_level(level)
        expected_temperature = 60
        expect(chiller.temperature).to eq(expected_temperature)
    end

end
