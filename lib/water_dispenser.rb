class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    if @reservoir.current_water_volume >= vessel.volume
      vessel.fill
    else
      vessel.fill(@reservoir.current_water_volume)
    end

    reservoir.drain(vessel.volume)
  end

end
