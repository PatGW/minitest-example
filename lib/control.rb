require './bike'
require './van'
require './person'
require './garage'
require './station'

Class Location

  def <<(bike)
     if space_available? 
      @bikes << bike
    else
      raise "No room for Bikes at Garage"
    end
  end

  def release_bike(bike)
    @bikes.pop
  end
end