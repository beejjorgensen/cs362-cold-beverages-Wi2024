class Vessel
  attr_reader :name, :volume, :volume_filled

  def initialize(name, volume)
    @name = name
    @volume = volume
    @volume_filled = 0
  end

  def empty?
    @volume_filled == 0
  end

  def fill(amount = @volume)
    @volume_filled = amount
  end

end
