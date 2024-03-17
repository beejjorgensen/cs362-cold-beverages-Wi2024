require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  let(:fridge) { Refrigerator.new(Chiller.new, Freezer.new, :control_panel, WaterDispenser.new, WaterReservoir.new) }

  it 'has a capacity, temp, power, and contents' do
    expect(fridge.freezer).to be_a(Freezer)
    expect(fridge.control_panel).to eq(:control_panel)
    expect(fridge.water_dispenser).to be_a(WaterDispenser)
    expect(fridge.water_reservoir).to be_a(WaterReservoir)
    expect(fridge.power).to eq(:off)
  end

  it 'can chill and freeze items' do
    fridge.chill(Item.new(volume = 10))
    fridge.freeze(Item.new(volume = 20))
    expect(fridge.remaining_capacity).to eq(170)
  end

  it 'can be plugged in and unplugged' do
    fridge.plug_in
    expect(fridge.power).to eq(:on)
    fridge.unplug
    expect(fridge.power).to eq(:off)
  end

  it 'can set chiller and freezer levels' do
    fridge.set_chiller_level(1)
    fridge.set_freezer_level(1)
    expect(fridge.chiller.temperature).to eq(60)
    expect(fridge.freezer.temperature).to eq(60)
  end

end
