require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has default values' do
    reservoir = WaterReservoir.new(10, 0)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir).to_not be_nil
  end

  it 'should be empty after draining all of its water' do
    reservoir = WaterReservoir.new(100, 0)
    reservoir.fill
    expect(reservoir).to_not be_empty
    reservoir.drain(100)
    expect(reservoir).to be_empty
  end

  it 'should be full after filling' do
    reservoir = WaterReservoir.new(100, 0)
    expect(reservoir).to be_empty
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(100)
  end
end
