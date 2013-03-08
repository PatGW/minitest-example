require './lib/location'

class Garage < Location

  CAPACITY = 10

  def initialize
  @bikes = []
  end

end