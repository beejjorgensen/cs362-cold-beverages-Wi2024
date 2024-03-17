require_relative '../lib/freezer'

describe 'A freezer' do

  let (:freezer) { Freezer.new }

  it 'has a capacity, temperature, power, and contents' do
    expect(freezer).to respond_to(:capacity)
    expect(freezer).to respond_to(:temperature)
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
    expect(freezer.instance_variable_get(:@contents)).to eq([])
  end

  it 'can be turned on' do
    freezer.turn_on
    expect(freezer.instance_variable_get(:@power)).to eq(:on)
  end

end
