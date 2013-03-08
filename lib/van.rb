require './lib/location'

class Van < Location

  CAPACITY = 4

  def initialize
    @bikes = []
  end

  private
  
  def space_available?
    @bikes.count < CAPACITY
  end
end
