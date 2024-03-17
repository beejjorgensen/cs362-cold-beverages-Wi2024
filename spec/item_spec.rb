require_relative '../lib/item'

describe 'An item of food or a beverage' do

  it 'has a name and a volume' do
    item = Item.new('Coke', 12)
    expect(item.name).to eq('Coke')
    expect(item.volume).to eq(12)
  end

end
