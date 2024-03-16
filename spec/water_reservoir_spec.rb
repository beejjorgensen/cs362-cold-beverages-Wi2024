require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'has capacity and water volume' do
    reservoir = WaterReservoir.new(10, 8)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(8)
  end

  it 'is empty when no volume' do
    reservoir = WaterReservoir.new(10, 0)
    expect(reservoir.empty?).to be_truthy
  end

  it 'is not empty when there is volume' do
    reservoir = WaterReservoir.new(10, 1)
    expect(reservoir.empty?).to be_falsey
  end

  it 'fills to capacity' do
    reservoir = WaterReservoir.new(10, 0)
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'drains current water volume' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'does not drain past current water volume' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(11)
    expect(reservoir.current_water_volume).to eq(0)
  end
end
