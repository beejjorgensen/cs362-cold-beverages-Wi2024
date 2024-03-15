class WaterReservoir

  attr_reader :capacity
  attr_accessor :current_water_volume

  def initialize(capacity = 10, initial_water_volume = 0)
    @capacity = capacity
    @current_water_volume = initial_water_volume
  end

  def empty?
    @current_water_volume == 0
  end

  def fill
    @current_water_volume = @capacity
  end

  def drain(volume)
    if volume < self.current_water_volume
      self.current_water_volume -= volume
    
     
      # raise "Sorry, not enough water left. We only have #{@current_water_volume} units of water."
    end
  end


end
