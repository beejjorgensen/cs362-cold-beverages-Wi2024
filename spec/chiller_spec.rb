require_relative '../lib/chiller'

describe 'A chiller' do
  it 'has capacity' do
    chiller = Chiller.new(50)
    expect(chiller.capacity).to eq(50)
  end

  it 'sets temperature to room temp at level 0' do
    chiller = Chiller.new
    chiller.set_level(0)
    expect(chiller.temperature).to eq(70)
  end

  it 'sets temperature to 0 at level 14' do
    chiller = Chiller.new
    chiller.set_level(14)
    expect(chiller.temperature).to eq(0)
  end
end
