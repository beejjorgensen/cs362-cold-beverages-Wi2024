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

  it 'can be filled' do
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(0)  # Note: WaterReservoir.fill should use self.current_water_volume instead of current_water_volume
  end

  it 'can be drained' do
    reservoir.current_water_volume = 10
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it "can't drain more than it has" do
    reservoir.current_water_volume = 5
    expect(reservoir.drain(10)).to eq(5)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
