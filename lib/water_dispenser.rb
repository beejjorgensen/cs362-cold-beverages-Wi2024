class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir = WaterReservoir.new)
    @reservoir = reservoir
  end

  def dispense(vessel)
    reservoir.drain(vessel.volume)
  end

end
