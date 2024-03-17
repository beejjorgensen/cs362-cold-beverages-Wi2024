class Vessel
  attr_reader :volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
  end

  def name
    @name
  end

end
