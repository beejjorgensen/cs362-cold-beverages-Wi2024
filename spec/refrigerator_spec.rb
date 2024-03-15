require_relative '../lib/refrigerator'

class FakeRefrigerator < Refrigerator
  attr_reader :power
  def initialize(chiller, freezer, water_dispenser, water_reservoir)
    super(chiller, freezer, water_dispenser, water_reservoir)
    @control_panel = "control_panel"
  end
end

class FakeChiller < Chiller
  attr_accessor :contents, :power
  def initalize(power = :off)
    super()
    @power = power
  end
  def remaining_capacity
    @capacity = 10
  end
end

class FakeFreezer < Freezer
  attr_accessor :contents, :power
  def initalize(power = :off)
    super()
    @power = power
  end
  def remaining_capacity
    @capacity = 10
  end

end

describe 'A refrigerator' do
  context'initializes and' do

    refrigerator = FakeRefrigerator.new("chiller", "freezer", "water_dispenser", "water_reservoir")
    it 'has a chiller' do
      expect(refrigerator.chiller).to eq("chiller")
    end
    it 'has a freezer' do
      expect(refrigerator.freezer).to eq("freezer")
    end
    it 'has a control_panel' do
      expect(refrigerator.control_panel).to eq("control_panel")
    end
    it 'has a water_dispenser' do
      expect(refrigerator.water_dispenser).to eq("water_dispenser")
    end
    it 'has a water_reservoir' do
      expect(refrigerator.water_reservoir).to eq("water_reservoir")
    end
    it 'its power is turned off' do
      expect(refrigerator.power).to eq(:off)
    end
  end

  it 'can add an item to chiller' do
    chiller = FakeChiller.new
    refrigerator = FakeRefrigerator.new(chiller, "freezer", "water_dispenser", "water_reservoir")
    refrigerator.chill("item")
    expect(chiller.contents).to include("item")
  end

  it 'can add an item to its freezer' do
    freezer = FakeFreezer.new
    refrigerator = FakeRefrigerator.new("chiller", freezer, "water_dispenser", "water_reservoir")
    refrigerator.freeze("item")
    expect(freezer.contents).to include("item")
  end

  it 'can report its total capacity' do
    chiller = FakeChiller.new
    freezer = FakeFreezer.new
    refrigerator = FakeRefrigerator.new(chiller, freezer, "water_dispenser", "water_reservoir")
    expect(refrigerator.total_capacity).to eq(200)
  end

  it 'can report its remaining_capacity' do
    chiller = FakeChiller.new
    freezer = FakeFreezer.new
    refrigerator = FakeRefrigerator.new(chiller, freezer, "water_dispenser", "water_reservoir")
    expect(refrigerator.remaining_capacity).to eq(20)
  end

  it 'can plug in' do
    chiller = FakeChiller.new(:off)
    freezer = FakeFreezer.new(:off)
    refrigerator = FakeRefrigerator.new(chiller, freezer, "water_dispenser", "water_reservoir")
    refrigerator.plug_in
    expect(chiller.power).to eq(:on)
    expect(freezer.power).to eq(:on)
  end

  it 'can be unplugged' do
    chiller = FakeChiller.new(:on)
    freezer = FakeFreezer.new(:on)
    refrigerator = FakeRefrigerator.new(chiller, freezer, "water_dispenser", "water_reservoir")
    refrigerator.unplug
    expect(chiller.power).to eq(:off)
    expect(freezer.power).to eq(:off)
  end

  it 'can set chiller level' do
    chiller = FakeChiller.new
    refrigerator = FakeRefrigerator.new(chiller, "freezer", "water_dispenser", "water_reservoir")
    refrigerator.set_chiller_level(2)
    expect(chiller.temperature).to eq(60)
  end

  it 'can set freezer level' do
    freezer = FakeFreezer.new
    refrigerator = FakeRefrigerator.new("chiller", freezer, "water_dispenser", "water_reservoir")
    refrigerator.set_freezer_level(2)
    expect(freezer.temperature).to eq(50)
  end


  before do
    @refrigerator = Refrigerator.new(FakeChiller.new, FakeFreezer.new, "water_dispenser", "water_reservoir")
    allow(@refrigerator.water_reservoir).to receive(:current_water_volume).and_return(15)
    allow(@refrigerator).to receive(:remaining_capacity).and_return(50)
  end

  it 'can print a string' do
    expected_string = <<~STATUS
      Power: off
      Storage: 50 of 200 available
      Temps: Chiller is 70, Freezer is 70
      Water: Reservoir has 15 remaining.
    STATUS
    expect(@refrigerator.to_s).to eq(expected_string)
  end


end
