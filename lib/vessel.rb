class Vessel
  attr_reader :name, :volume, :current_water_volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @current_water_volume = 0
  end

  def fill(volume)
    @current_water_volume = volume
  end
  
  def empty?
    current_water_volume == 0
  end

end