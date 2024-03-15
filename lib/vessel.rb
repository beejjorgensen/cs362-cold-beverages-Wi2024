class Vessel
  attr_reader :name, :volume, :current_volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @current_volume = 0
  end

  def empty?
    @current_volume == 0
  end

  def fill
    @current_volume = @volume
  end

end
