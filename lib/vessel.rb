class Vessel
  attr_reader :name, :capacity, :volume

  def initialize(name, capacity, volume = 0)
    @name = name
    @capacity = capacity
    @volume = volume
  end

  def empty?
    if @volume == 0
      return true
    else
      return false
    end
  end

  def fill
    @volume = @capacity
  end

end
