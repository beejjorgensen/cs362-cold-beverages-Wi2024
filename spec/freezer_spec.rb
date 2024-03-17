require_relative '../lib/freezer'

describe 'A freezer' do
    it 'has a capacity and a temperature' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(70)
    end

    it 'keeps track of remaining capacity' do
        freezer = Freezer.new
        freezer.add(Item.new("Fake",10))
        expect(freezer.remaining_capacity).to eq(90)
    end
end
