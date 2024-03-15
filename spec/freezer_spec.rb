require_relative '../lib/freezer'

class TestFreezer < Freezer
  attr_accessor :power, :contents
end


describe 'A freezer' do
  context 'initalizes and' do
    freezer = TestFreezer.new
    it 'has capacity' do
      expect(freezer.capacity).to eq(100)
    end
    it 'has temperature' do
      expect(freezer.temperature).to eq(70)
    end
    it 'has power' do
      expect(freezer.power).to eq(:off)
    end
    it 'contents' do
      expect(freezer.contents).to eq([])
    end
  end

  it 'can turn on' do
    freezer = TestFreezer.new
    freezer.turn_on
    expect(freezer.power).to eq(:on)
  end

  it 'can turn off' do
    freezer = TestFreezer.new(power: :on)
    freezer.turn_off
    expect(freezer.power).to eq(:off)
  end

  it 'can add items' do
    freezer = TestFreezer.new(power: :on)
    fakeItem = Item.new("fakeItem", 5)
    freezer.add(fakeItem)
    expect(freezer.contents).to include(fakeItem)
  end

  it 'can report remaining_capacity' do
    freezer = TestFreezer.new
    fakeItem = Item.new("fakeItem", 5)
    freezer.contents = [fakeItem]
    expect(freezer.remaining_capacity).to eq(95)
  end

  it 'can set temperature' do
    freezer = TestFreezer.new(power: :on)
    freezer.set_level(1)
    expect(freezer.temperature).to eq(60)
  end

end
