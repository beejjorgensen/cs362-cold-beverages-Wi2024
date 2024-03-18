require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    let(:chiller) { Chiller.new(100) }
    let(:freezer) { Freezer.new(100) }
    let(:water_reservoir) { WaterReservoir.new() }
    let(:water_dispenser) { WaterDispenser.new(water_reservoir) }
    let(:refrigerator) { Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir) }
    let(:item) { Item.new('FAKE', 100) }

    it 'has a chiller, freezer, water dispenser, and water reservoir' do
        expect(refrigerator.chiller).to eq(chiller)
        expect(refrigerator.freezer).to eq(freezer)
        expect(refrigerator.water_dispenser).to eq(water_dispenser)
        expect(refrigerator.water_reservoir).to eq(water_reservoir)
    end

    it 'can chill item' do
        refrigerator.chill(item)
        expect(refrigerator.chiller.contents).to eq([item])
    end

    it 'can freeze item' do
        refrigerator.freeze(item)
        expect(refrigerator.freezer.contents).to eq([item])
    end

    it 'can return the total capacity of the chiller and freezer' do
        expect(refrigerator.total_capacity).to eq(200)
    end

    it 'can return the total remaining capacity of the chiller and freezer' do
        refrigerator.chill(item)
        expect(refrigerator.remaining_capacity).to eq(100)
    end

    it 'can turn on the refrigerator, and therefore the chiller and freezer ' do
        refrigerator.plug_in
        expect(refrigerator.power).to eq(:on)
        expect(refrigerator.chiller.power).to eq(:on)
        expect(refrigerator.freezer.power).to eq(:on)
    end

    it 'can turn off the refrigerator, and therefore the chiller and freezer' do
        refrigerator.unplug
        expect(refrigerator.power).to eq(:off)
        expect(refrigerator.chiller.power).to eq(:off)
        expect(refrigerator.freezer.power).to eq(:off)
    end

    it 'can set the chiller level' do
        refrigerator.set_chiller_level(3)
        expect(refrigerator.chiller.temperature).to eq(55)
    end

    it 'can set the freezer level' do
        refrigerator.set_freezer_level(3)
        expect(refrigerator.freezer.temperature).to eq(40)
    end

    it 'can return a to_s representation of the refrigerator' do
        expect(refrigerator.to_s).to eq("Power: off\nStorage: 200 of 200 available\nTemps: Chiller is 70, Freezer is 70\nWater: Reservoir has 0 remaining.\n")
    end
end
