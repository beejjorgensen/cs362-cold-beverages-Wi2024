class Vessel
  attr_reader :name, :volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @contents = 0
  end

  def empty?
    @contents.zero?
  end

  def fill
    @contents = @volume
  end

end
