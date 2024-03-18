require_relative '../lib/chiller'

describe 'A chiller' do
    it "has capacity and temprature" do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
    end
end
