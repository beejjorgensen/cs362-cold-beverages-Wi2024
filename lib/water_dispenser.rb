class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    if @reservoir.current_water_volume < vessel.capacity-vessel.volume
      raise 'Not enough water in the reservoir'
    else
      @reservoir.drain(vessel.capacity-vessel.volume)
      vessel.fill()
    end
  end

end
