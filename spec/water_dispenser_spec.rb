require_relative '../lib/water_dispenser'

class FakeReservoir
  attr_reader :amount
  def drain(amount)
    @amount = amount
  end
end



describe 'A water dispenser' do

  it 'takes a reservoir' do
    reservoir = FakeReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'dispenses out a vessel volume amount' do
    reservoir = FakeReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new("fakeVessel", 100)
    dispenser.dispense(vessel)
    expect(reservoir.amount).to eq(100)
  end
end
