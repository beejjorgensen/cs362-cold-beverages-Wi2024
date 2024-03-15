require_relative '../lib/chiller'

class TestChiller < Chiller
  attr_accessor :power, :contents
end

describe 'A chiller' do
  context 'initalizes and' do
    chiller = TestChiller.new
    it 'has capacity' do
      expect(chiller.capacity).to eq(100)
    end
    it 'has temperature' do
      expect(chiller.temperature).to eq(70)
    end
    it 'has power' do
      expect(chiller.power).to eq(:off)
    end
    it 'contents' do
      expect(chiller.contents).to eq([])
    end
  end

  it 'can turn on' do
    chiller = TestChiller.new
    chiller.turn_on
    expect(chiller.power).to eq(:on)
  end

  it 'can turn off' do
    chiller = TestChiller.new(power: :on)
    chiller.turn_off
    expect(chiller.power).to eq(:off)
  end

  it 'can add items' do
    chiller = TestChiller.new(power: :on)
    fakeItem = Item.new("fakeItem", 5)
    chiller.add(fakeItem)
    expect(chiller.contents).to include(fakeItem)
  end

  it 'can report remaining_capacity' do
    chiller = TestChiller.new
    fakeItem = Item.new("fakeItem", 5)
    chiller.contents = [fakeItem]
    expect(chiller.remaining_capacity).to eq(95)
  end

  it 'can set temperature' do
    chiller = TestChiller.new(power: :on)
    chiller.set_level(1)
    expect(chiller.temperature).to eq(65)
  end
end
