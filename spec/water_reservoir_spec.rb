require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has a capacity and current water volume' do
    reservoir = WaterReservoir.new
    expect(reservoir).to respond_to(:capacity)
    expect(reservoir).to respond_to(:current_water_volume)
  end

end
