require_relative '../lib/freezer'

describe 'A freezer' do
  it 'has capacity' do
    freezer = Freezer.new(50)
    expect(freezer.capacity).to eq(50)
  end

  it 'sets temperature to room temp at level 0' do
    freezer = Freezer.new
    freezer.set_level(0)
    expect(freezer.temperature).to eq(70)
  end

  it 'sets temperature to 0 at level 7' do
    freezer = Freezer.new
    freezer.set_level(7)
    expect(freezer.temperature).to eq(0)
  end

end
