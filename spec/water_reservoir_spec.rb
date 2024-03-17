require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    let(:reservoir) { WaterReservoir.new}

    it 'has an initial water volume of zero' do
        expect(reservoir.current_water_volume).to eq(0)
    end

    it 'has a max capacity of ten' do
        expect(reservoir.capacity).to eq(10)
    end

    it 'is initially empty' do
        expect(reservoir.empty?).to be true
    end

    context 'when draining water' do
        let(:reservoir) { WaterReservoir.new(10, 5) }

        it 'lowers the current water volume level' do
            starting_volume = reservoir.current_water_volume
            drained_volume = 3
            reservoir.drain(drained_volume)
            expect(reservoir.current_water_volume).to eq(2)
        end
    end

end
