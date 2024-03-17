require_relative '../lib/freezer'

describe 'A freezer' do
    let(:freezer) { Freezer.new }

    it 'has an initial capacity of 100' do
        expect(freezer.capacity).to eq(100)
    end

    it 'has initially empty contents' do
        expect(freezer.remaining_capacity).to eq(freezer.capacity)
    end


end
