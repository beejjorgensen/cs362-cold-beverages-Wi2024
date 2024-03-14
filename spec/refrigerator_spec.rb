require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  before(:each) do
    @chiller = Chiller.new
    @freezer = Freezer.new
    @water_reservoir = WaterReservoir.new(100, 0)
    @water_dispenser = WaterDispenser.new(@water_reservoir)
    @refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser, @water_reservoir)
  end

  it 'has a chiller, freezer, water dispenser, and a water_reservoir' do
    expect(@refrigerator.chiller).to_not be_nil
    expect(@refrigerator.freezer).to_not be_nil
    expect(@refrigerator.water_dispenser).to_not be_nil
    expect(@refrigerator.water_reservoir).to_not be_nil
  end

  it 'add an item to the chiller' do
    item = Item.new('fruit salad, yummy yummy', 1)
    @refrigerator.chill(item)
    expect(@chiller.contents).not_to be_empty
  end

  it 'add an item to the freezer' do
    item = Item.new('fruit salad, yummy yummy', 1)
    @refrigerator.freeze(item)
    expect(@freezer.contents).not_to be_empty
  end

  it 'can get the total capacity of the refrigerator' do
    expect(@refrigerator.total_capacity).to eq(200)
  end

  it 'can get the total remaining capacity of the refrigerator' do
    item = Item.new('fruit salad, yummy yummy', 1)
    item2 = Item.new('loose stick of butter', 1)
    @refrigerator.chill(item)
    @refrigerator.freeze(item2)
    expect(@refrigerator.remaining_capacity).to eq(198)
  end

  it 'can be plugged in' do
    @refrigerator.plug_in
    expect(@refrigerator.power).to eq(:on)
    expect(@chiller.power).to eq(:on)
    expect(@freezer.power).to eq(:on)
  end

  it 'can be unplugged' do
    @refrigerator.unplug
    expect(@refrigerator.power).to eq(:off)
    expect(@chiller.power).to eq(:off)
    expect(@freezer.power).to eq(:off)
  end

  it 'can set the chiller level' do
    @refrigerator.set_chiller_level(3)
    expect(@chiller.temperature).to eq(55)
  end

  it 'can set the freezer level' do
    @refrigerator.set_freezer_level(3)
    expect(@freezer.temperature).to eq(40)
  end

  it 'can report its status' do
    expect(@refrigerator.to_s).to eq("Power: #{@refrigerator.power}\nStorage: #{@refrigerator.remaining_capacity} of #{@refrigerator.total_capacity} available\nTemps: Chiller is #{@refrigerator.chiller.temperature}, Freezer is #{@refrigerator.freezer.temperature}\nWater: Reservoir has #{@refrigerator.water_reservoir.current_water_volume} remaining.\n")
  end
end
