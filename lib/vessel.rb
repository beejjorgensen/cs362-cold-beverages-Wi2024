class Vessel
  attr_reader :name, :volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @volume_filled = 0
  end

  def empty?
    @volume_filled == 0
  end

end
