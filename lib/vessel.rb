class Vessel
  attr_reader :volume, :name , :current_volume

  def initialize(name= "FAKE", volume=100)
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
