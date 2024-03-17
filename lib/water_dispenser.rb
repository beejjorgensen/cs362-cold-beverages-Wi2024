class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    amount_drained = reservoir.drain(vessel.volume)
    vessel.fill
  end

end
