require_relative '../lib/chiller'

describe 'A chiller' do
    it "has capacity and temprature" do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
    end

    it 'is initially off' do
        chiller = Chiller.new
        expect(chiller.get_power).to eq(:off)
    end

    it 'can be turned on and off' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.get_power).to eq(:on)
        chiller.turn_off
        expect(chiller.get_power).to eq(:off)
    end

    it 'can set temperature level' do
        chiller = Chiller.new(temperature = 70)
        chiller.set_level(14)
        expect(chiller.temperature).to eq(0)
    end

end

