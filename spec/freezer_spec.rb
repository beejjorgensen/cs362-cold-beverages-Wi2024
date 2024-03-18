require_relative '../lib/freezer'

describe 'A freezer' do
    let(:freezer) { Freezer.new }
    let(:item) { double("item", volume: 10) }
  
    describe "power management" do
      it "starts off" do
        expect(freezer.power).to eq(:off)
      end
  
      it "can be turned on" do
        freezer.turn_on
        expect(freezer.power).to eq(:on)
      end
  
      it "can be turned off" do
        freezer.turn_on
        freezer.turn_off
        expect(freezer.power).to eq(:off)
      end
    end
  
    describe "adding items" do
      context "when freezer is on" do
        before { freezer.turn_on }
  
        it "adds items with volume" do
          freezer.add(item)
          expect(freezer.contents).to include(item)
        end
      end
    end
  
    describe "remaining capacity" do
      it "calculates remaining space" do
        freezer.add(double("item", volume: 50))
        expect(freezer.remaining_capacity).to eq(50)
      end
    end
  
    describe "setting temperature level" do
    context "when freezer is on" do
    before { freezer.turn_on }
    end
    end
end
