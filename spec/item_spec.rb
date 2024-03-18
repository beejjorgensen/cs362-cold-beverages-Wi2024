require_relative '../lib/item'

describe 'An item of food or a beverage' do
    it 'has a name and volume' do
        vessel = Item.new('FAKE', 100)
        expect(vessel.name).to eq('FAKE')
        expect(vessel.volume).to eq(100)
    end
end
