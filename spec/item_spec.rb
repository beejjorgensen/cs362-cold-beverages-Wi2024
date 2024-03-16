require_relative '../lib/item'

describe 'An item of food or a beverage' do
    it 'has a name and volume' do
        item = Item.new('name', 12)
        expect(item.name).to eq('name')
        expect(item.volume).to eq(12)
    end

end
