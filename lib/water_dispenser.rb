class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    if reservoir.current_water_volume > vessel.volume
      reservoir.drain(vessel.volume)
      vessel.fill(vessel.volume)
    else
      volume_before_drain = reservoir.current_water_volume
      reservoir.drain(reservoir.current_water_volume)
      vessel.fill(volume_before_drain)
    end
  end

end
