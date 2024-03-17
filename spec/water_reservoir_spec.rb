require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  
  let (:reservoir) { WaterReservoir.new }

  it 'has a capacity and current water volume' do
    expect(reservoir).to respond_to(:capacity)
    expect(reservoir).to respond_to(:current_water_volume)
  end

  it "can tell when it's empty" do
    reservoir.current_water_volume = 0
    expect(reservoir.empty?).to be_truthy
  end

  it "can tell when it's not empty" do
    reservoir.current_water_volume = 1
    expect(reservoir.empty?).to be_falsy
  end

end
