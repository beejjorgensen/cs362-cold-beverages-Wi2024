require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'has capacity and water volume' do
    reservoir = WaterReservoir.new(10, 8)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(8)
  end
end
