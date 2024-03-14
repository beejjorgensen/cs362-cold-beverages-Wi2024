class WaterReservoir

  attr_reader :capacity
  attr_accessor :current_water_volume
  DRAIN_FLOOR = 0

  def initialize(capacity = 10, initial_water_volume = 0)
    @capacity = capacity
    @current_water_volume = initial_water_volume
  end

  def empty?
    @current_water_volume == 0 
    #BUG FIXED not using instance variable
  end

  def fill
    @current_water_volume = capacity 
    #BUG FIXED not using instance variable
  end

  def drain(volume)
    self.current_water_volume -= volume
    if (self.current_water_volume < DRAIN_FLOOR)  
        self.current_water_volume = DRAIN_FLOOR 
    end
  end

end
