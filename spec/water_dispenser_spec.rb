require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a reservoir' do
    dispenser = WaterDispenser.new(nil)
    expect(dispenser).to respond_to(:reservoir)
  end

end
