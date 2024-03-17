require_relative '../lib/item'

describe 'An item of food or a beverage' do

    it 'has a name and volume' do
        item = Item.new('Bevarage', 200)
        expect(item.name).to eq('Bevarage')
        expect(item.volume).to eq(200)
      end
    

end
