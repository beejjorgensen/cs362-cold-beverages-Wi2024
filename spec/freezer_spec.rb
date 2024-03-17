require_relative '../lib/freezer'

describe 'A freezer' do

  it 'has a capacity and temperature' do
    freezer = Freezer.new
    expect(freezer).to respond_to(:capacity)
    expect(freezer).to respond_to(:temperature)
  end

end
