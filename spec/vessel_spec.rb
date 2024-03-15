require_relative '../lib/vessel'

describe 'A vessel for holding liquid' do

  it 'has a name, volume, and current water volume' do
    vessel = Vessel.new('FAKE', 100)
    expect(vessel.name).to eq('FAKE')
    expect(vessel.volume).to eq(100)
    expect(vessel.current_water_volume).to eq(0)
  end

  it 'is initially empty' do
    vessel = Vessel.new('FAKE', 100)
    expect(vessel).to be_empty
  end

  it 'is no longer empty when we fill it' do
    vessel = Vessel.new('FAKE', 100)
    vessel.fill(vessel.volume)
    expect(vessel).to_not be_empty
  end

  it 'should equal its volume when filled' do
    vessel = Vessel.new('FAKE', 100)
    vessel.fill(vessel.volume)
    expect(vessel.current_water_volume).to eq(vessel.volume)
  end
end