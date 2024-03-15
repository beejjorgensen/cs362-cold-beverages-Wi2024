require_relative '../lib/water_reservoir'

describe 'A water resevoir' do

    it 'has default capacity and current water volume' do
        resevoir = WaterReservoir.new
        expect(resevoir.capacity).to eq(10)
        expect(resevoir.current_water_volume).to eq(0)
    end

    it 'capacity and current water volume overridden' do
        resevoir = WaterReservoir.new(100, 10)
        expect(resevoir.capacity).to eq(100)
        expect(resevoir.current_water_volume).to eq(10)
      end
  
    it 'is initially empty' do
        resevoir = WaterReservoir.new
        expect(resevoir.empty?).to eq(true)
    end
  
    it 'is no longer empty when we fill it' do
        resevoir = WaterReservoir.new
        resevoir.fill
        expect(resevoir.empty?).to eq(false)
    end

    it 'can be filled to capacity' do
        resevoir = WaterReservoir.new
        resevoir.fill
        expect(resevoir.current_water_volume).to eq(resevoir.capacity)
    end
  
    it 'can be drained by an amount' do
        resevoir = WaterReservoir.new(100, 10)
        resevoir.drain(5)
        expect(resevoir.current_water_volume).to eq(5)
    end

    it 'can be drained by an amount' do
        resevoir = WaterReservoir.new(100, 5)
        resevoir.drain(5)
        expect(resevoir.current_water_volume).to eq(0)
    end
  end