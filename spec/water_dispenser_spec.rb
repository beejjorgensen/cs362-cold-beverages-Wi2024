require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a reservoir' do
    dispenser = WaterDispenser.new(nil)
    expect(dispenser).to respond_to(:reservoir)
  end

  it 'can dispense water' do
    reservoir = spy(:water_reservoir)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new()

    dispenser.dispense(vessel)

    expect(reservoir).to have_received(:drain).with(vessel.volume)
  end

end
