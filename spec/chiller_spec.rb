require_relative '../lib/chiller'

describe 'A chiller' do
    let(:chiller) { Chiller.new }
    let(:item) { double("item", volume: 10) }
  
    describe "power management" do
      it "starts off" do
        expect(chiller.power).to eq(:off)
      end
  
      it "can be turned on" do
        chiller.turn_on
        expect(chiller.power).to eq(:on)
      end
  
      it "can be turned off" do
        chiller.turn_on
        chiller.turn_off
        expect(chiller.power).to eq(:off)
      end
    end
  
    describe "adding items" do
      context "when chiller is on" do
        before { chiller.turn_on }
      end
    end
  
    describe "remaining capacity" do
      it "calculates remaining space" do
        chiller.add(double("item", volume: 50))
        expect(chiller.remaining_capacity).to eq(50)
      end
    end
  
    describe "setting temperature level" do
      context "when chiller is on" do
        before { chiller.turn_on }
      end
  
    end
end
