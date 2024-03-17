class Item
  attr_reader :name, :volume

  def initialize(name = 'FAKE', volume)
    @name = name
    @volume = volume
  end

end
