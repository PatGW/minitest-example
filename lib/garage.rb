class Garage

  CAPACITY = 10

  def initialize
  @bikes = []
  end

  def receive_bike(bike)
     if space_available? 
      @bikes << bike
    else
      raise "No room for Bikes at Garage"
    end
  end

  def release_bike(bike)
    @bikes.pop
  end


  def count_bikes_in_garage
    @bikes.count
  end

  private

  def space_available?
    @bikes.count < CAPACITY
  end
end