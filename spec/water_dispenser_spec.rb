require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

    let(:reservoir) { double("Reservoir") }
    let(:vessel) { double("Vessel", volume: 100) }


    it 'has a reservoir' do
        wd = WaterDispenser.new(reservoir)
        expect(wd.reservoir).to eq(reservoir)
    end

    it 'can dispense a volume of water' do
        wd = WaterDispenser.new(reservoir)
        expect(reservoir).to receive(:drain).with(100)
        wd.dispense(vessel)
    end

end
