class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    water = Item.new('Water', reservoir.drain(vessel.volume))
    vessel.fill(water)
    return water.volume#allow the test to pass with a plain value
  end

end
