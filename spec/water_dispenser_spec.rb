require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it 'dispenses water from water reservoir' do
        mock_water_reservoir = double("reservoir")
        allow(mock_water_reservoir).to receive(:drain).with(50)
        water_dispenser = WaterDispenser.new(mock_water_reservoir)
        mock_vessel = double("vessel", volume: 50)
        water_dispenser.dispense(mock_vessel)
        expect(mock_water_reservoir).to have_received(:drain).with(50)

    end
end