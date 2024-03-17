require_relative '../lib/freezer'

describe 'A freezer' do
    let(:freezer) { Freezer.new }
    let(:item) { Item.new("ice cream", 10) }

    it 'has an initial capacity of 100' do
        expect(freezer.capacity).to eq(100)
    end

    it 'has initially empty contents' do
        expect(freezer.remaining_capacity).to eq(freezer.capacity)
    end

    it 'can have an item added to it, lowering the remaining capacity' do
        freezer.add(item)
        expect(freezer.remaining_capacity).to eq(90)
    end

    it 'can be turned on' do
        freezer.turn_on
        expect(freezer.instance_variable_get(:@power)).to eq(:on)
    end

    it 'can be turned off' do
        freezer.turn_off
        expect(freezer.instance_variable_get(:@power)).to eq(:off)
    end

    it 'can have the temperature level changed' do
        level = 2
        freezer.set_level(level)
        expected_temperature = 50
        expect(freezer.temperature).to eq(expected_temperature)
    end


end
