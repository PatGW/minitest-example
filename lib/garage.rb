class Garage

  def initialize
  @bikes = []
  end

  def receive_bike(bike)
    @bikes << bike
  end

  def release_bike(bike)
    @bikes.pop
  end


  def count_bikes_in_garage
    @bikes.count
  end

end

