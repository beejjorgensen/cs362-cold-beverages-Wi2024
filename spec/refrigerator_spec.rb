require_relative '../lib/refrigerator'

describe 'A refrigerator' do

  it 'has a capacity, temp, power, and contents' do
    fridge = Refrigerator.new(Chiller.new, Freezer.new, ControlPanel.new, WaterDispenser.new, WaterReservoir.new)
    expect(fridge.chiller).to be_a(Chiller)
    expect(fridge.freezer).to be_a(Freezer)
    expect(fridge.control_panel).to be_a(ControlPanel)
    expect(fridge.water_dispenser).to be_a(WaterDispenser)
    expect(fridge.water_reservoir).to be_a(WaterReservoir)
    expect(fridge.power).to eq(:off)
  end

end
