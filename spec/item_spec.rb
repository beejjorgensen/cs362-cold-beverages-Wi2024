require_relative '../lib/item'

describe 'An item of food or a beverage' do
  it 'has a name and volume' do
    item = Item.new("testItem", 10)
    expect(item.name).to eq("testItem")
    expect(item.volume).to eq(10)
  end
end
