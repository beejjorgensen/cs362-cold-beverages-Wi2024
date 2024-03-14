require_relative '../lib/freezer.rb'
class Chiller < Freezer


  def set_level(level)
    @temperature = ROOM_TEMPERATURE - level * 5
  end

end

#it hurt too much to see blatant duplicate code.
#If someone one needs different behavior, 
#they can override the method. case in point, the set level function.
#(no functionality was changed 
#in the the legacy code base by this refactoring)