class Vessel
  attr_reader :volume, :name, :filled_volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @filled_volume = 0
  end

  def empty?
    if @filled_volume == 0
      true
    else
      false
    end
  end

  def fill
    @filled_volume = @volume
  end
end
