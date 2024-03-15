require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'with passed paramaters it has capacity and current water volume' do
    reservoir = WaterReservoir.new(10,0)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'with default paramaters it has capacity and current water volume' do
    reservoir = WaterReservoir.new
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'can report when empty' do
    reservoir = WaterReservoir.new(10,0)
    expect(reservoir).to be_empty
  end

  it 'can fill to capacity' do
    reservoir = WaterReservoir.new(10,0)
    reservoir.fill
    expect(reservoir).not_to be_empty
  end

  it 'can drain' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(6)
    expect(reservoir.current_water_volume).to eq(4)
  end

  it 'can not drain below 0' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(20)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
