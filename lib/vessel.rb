class Vessel
  attr_reader :name, :volume

  def initialize(name="FAKE", volume=100)
    @name = name
    @volume = volume
    @empty = true
  end

  def fill
    @empty=false
  end

  def empty?
    return @empty
  end

end
