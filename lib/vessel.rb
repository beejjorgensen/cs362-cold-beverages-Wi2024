class Vessel
  attr_reader :volume
  attr_reader :name

                  #unsure about adding "name = 'FAKE', volume = 100' to the initialize method". Bad to have test data in the code? Bad test?
  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @full = 0
  end

  def fill
    @full = 1
  end

  def full?
    @full == 1
  end

  def empty?
    @full.zero?
  end
end