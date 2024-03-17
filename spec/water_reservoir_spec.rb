require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  let(:water_reservoir) { WaterReservoir.new(200, 150) }

  it 'has a capacity and a current volume' do
    expect(water_reservoir.capacity).to eq(200)
    expect(water_reservoir.volume).to eq(150)
  end

  it 'is empty when its volume is 0' do
    water_reservoir.volume = 0
    expect(water_reservoir.empty?).to be(true)
  end

  it 'is not empty when its volume is greater than 0' do
    expect(water_reservoir.empty?).to be(false)
  end

  it 'can be filled' do
    water_reservoir.volume = 0
    water_reservoir.fill
    expect(water_reservoir.volume).to eq(200)
  end

  it 'can be drained' do
    water_reservoir.drain(50)
    expect(water_reservoir.volume).to eq(100)
  end

  it 'will not drain more than its current volume' do
    water_reservoir.drain(200)
    expect(water_reservoir.volume).to eq(0)
  end

end
