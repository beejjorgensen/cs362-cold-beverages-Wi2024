require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    let(:chiller) { double("Chiller", set_level: nil, temperature: nil, turn_on: nil, turn_off: nil) }
    let(:freezer) { double("freezer", set_level: nil, temperature: nil, turn_on: nil, turn_off: nil) }
    let(:water_dispenser) { double("waterdispenser") }
    let(:water_reservoir) { double("waterreservoir") }

    let(:refrigerator) { Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)}


    it 'exists as a working fridge' do
        expect(refrigerator).to be_instance_of(Refrigerator)
    end


    it 'can add items to the freezer and chiller' do
        item = double("Item")
        expect(chiller).to receive(:add).with(item)
        expect(freezer).to receive(:add).with(item)
        refrigerator.chill(item)
        refrigerator.freeze(item)
    end


    it 'can be plugged in to be turned on' do
        refrigerator.plug_in
        expect(refrigerator.instance_variable_get(:@power)).to eq(:on)
        expect(chiller).to have_received(:turn_on)
        expect(freezer).to have_received(:turn_on)
    end


    it 'can be unplugged to be turned off' do
        refrigerator.unplug
        expect(refrigerator.instance_variable_get(:@power)).to eq(:off)
        expect(chiller).to have_received(:turn_off)
        expect(freezer).to have_received(:turn_off)
    end

    it 'can set the levels of the chiller and freezer' do
        chiller_level = 3
        freezer_level = 2
        refrigerator.set_chiller_level(chiller_level)
        refrigerator.set_freezer_level(freezer_level)
        expect(chiller).to have_received(:set_level).with(chiller_level)
        expect(freezer).to have_received(:set_level).with(freezer_level)

    end

end
