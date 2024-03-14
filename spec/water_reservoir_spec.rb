﻿require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'has a default capacity and current volume' do
    reservoir = WaterReservoir.new
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'has a set capacity and current volume' do
    reservoir = WaterReservoir.new(20, 10)
    expect(reservoir.capacity).to eq(20)
    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'is initially empty' do
    reservoir = WaterReservoir.new
    expect(reservoir).to be_empty
  end

  it 'is no longer empty when we fill it' do
    reservoir = WaterReservoir.new
    reservoir.fill
    expect(reservoir).to_not be_empty
  end
end
