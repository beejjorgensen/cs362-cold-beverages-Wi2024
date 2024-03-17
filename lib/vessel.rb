class Vessel
  attr_reader :volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @empty = true
  end

  def name
    @name
  end

  def volume
    @volume
  end

  def empty?
    @empty
  end

  def fill
    @empty = false
  end

end
