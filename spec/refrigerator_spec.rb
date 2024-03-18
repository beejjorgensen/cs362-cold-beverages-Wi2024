require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    it 'has a chiller, freezer, water dispenser, and water reservoir' do
        chiller = Chiller.new(100)
        freezer = Freezer.new(100)
        water_reservoir = WaterReservoir.new()
        water_dispenser = WaterDispenser.new(water_reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)
        expect(refrigerator.chiller).to eq(chiller)
        expect(refrigerator.freezer).to eq(freezer)
        expect(refrigerator.water_dispenser).to eq(water_dispenser)
        expect(refrigerator.water_reservoir).to eq(water_reservoir)
    end

    it 'can chill item' do
        chiller = Chiller.new(100)
        freezer = Freezer.new(100)
        water_reservoir = WaterReservoir.new()
        water_dispenser = WaterDispenser.new(water_reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)
        item = Item.new('FAKE', 100)
        refrigerator.chill(item)
        expect(refrigerator.chiller.contents).to eq([item])
    end

    it 'can freeze item' do
        chiller = Chiller.new(100)
        freezer = Freezer.new(100)
        water_reservoir = WaterReservoir.new()
        water_dispenser = WaterDispenser.new(water_reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)
        item = Item.new('FAKE', 100)
        refrigerator.freeze(item)
        expect(refrigerator.freezer.contents).to eq([item])
    end

    it 'can return the total capacity of the chiller and freezer' do
        chiller = Chiller.new(100)
        freezer = Freezer.new(100)
        water_reservoir = WaterReservoir.new()
        water_dispenser = WaterDispenser.new(water_reservoir)
        refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)
        expect(refrigerator.total_capacity).to eq(200)
    end
end
