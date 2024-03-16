class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    reservoir.drain(vessel.volume)
  end

  def fill
    reservoir.fill
  end

end
