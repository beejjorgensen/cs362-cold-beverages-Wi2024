class Vessel
  attr_reader :volume, :name

  #these should not have defaults, but they have to
  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @contents = []
  end

  def empty?
    @contents.empty?
  end

  def fill
    @contents.append('FAKE_THING')
  end
end
