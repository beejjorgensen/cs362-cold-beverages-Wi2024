class Vessel
  attr_reader :volume

  def initialize(name = 'FAKE', volume = 100, empty = true)
    @name = name
    @volume = volume
    @empty = empty
  end

  def name
    @name
  end

  def empty?
    @empty
  end

  def fill
    @empty = false
  end

end
