require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

    it 'has default capacity and current water volume' do
        reservoir = WaterReservoir.new
        expect(reservoir.capacity).to eq(100)
        expect(reservoir.current_water_volume).to eq(0)
    end

    it 'capacity and current water volume overridden' do
        reservoir = WaterReservoir.new(100, 10)
        expect(reservoir.capacity).to eq(100)
        expect(reservoir.current_water_volume).to eq(10)
      end
  
    it 'is initially empty' do
        reservoir = WaterReservoir.new
        expect(reservoir.empty?).to eq(true)
    end
  
    it 'is no longer empty when we fill it' do
        reservoir = WaterReservoir.new
        reservoir.fill
        expect(reservoir.empty?).to eq(false)
    end

    it 'can be filled to capacity' do
        reservoir = WaterReservoir.new
        reservoir.fill
        expect(reservoir.current_water_volume).to eq(reservoir.capacity)
    end
  
    it 'can be drained by an amount' do
        reservoir = WaterReservoir.new(100, 10)
        reservoir.drain(5)
        expect(reservoir.current_water_volume).to eq(5)
    end

    it 'can be drained by an amount' do
        reservoir = WaterReservoir.new(100, 5)
        reservoir.drain(5)
        expect(reservoir.current_water_volume).to eq(0)
    end
  end