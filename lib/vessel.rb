class Vessel
  attr_reader :name, :volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
  end

  def empty?()
    if(@volume == 0)
      return false
    else
      return true
    end
  end

  def fill()
    @volume = 0
  end

end
