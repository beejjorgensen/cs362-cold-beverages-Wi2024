require_relative '../lib/item'

describe 'An item of food or a beverage' do

  it 'has a name and a volume' do
    item = Item.new("Item Name", 5)
    expect(item).to respond_to(:name)
    expect(item).to respond_to(:volume)
  end

end
