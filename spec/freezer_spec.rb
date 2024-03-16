require_relative '../lib/freezer'

describe 'A freezer' do
  it 'has capacity' do
    freezer = Freezer.new(50)
    expect(freezer.capacity).to eq(50)
  end
end
