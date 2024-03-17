class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir = WaterReservoir.new)
    @reservoir = reservoir
  end

  def dispense(vessel)
    vessel.fill
    reservoir.drain(vessel.volume)
  end

end
