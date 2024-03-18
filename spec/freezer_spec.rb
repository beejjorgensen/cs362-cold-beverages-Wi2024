require_relative '../lib/freezer'

describe 'A freezer' do

    it 'has a capacity and temperature' do
        freezer = Freezer.new(10)
        expect(freezer.capacity).to eq(10)
        expect(freezer.temperature).to eq(70)
    end

    it 'is initially off' do
        freezer = Freezer.new
        expect(freezer.get_power).to eq(:off)
    end

    it 'can be turned on and off' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.get_power).to eq(:on)
        freezer.turn_off
        expect(freezer.get_power).to eq(:off)
    end

    it 'can set temperature level' do
        freezer = Freezer.new(temperature = 70)
        freezer.set_level(7)
        expect(freezer.temperature).to eq(0)
    end

end
