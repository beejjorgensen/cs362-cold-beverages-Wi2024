require_relative '../lib/chiller'

describe 'A chiller' do
    it ' has capacity, temperature, power, and contents' do
        chiller = Chiller.new()
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
        expect(chiller.power).to eq(:off)
        expect(chiller.contents).to eq([])
    end



end
