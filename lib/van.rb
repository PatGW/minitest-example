class Van

  def initialize
    @bikes = []
  end

  def receive_bike(bike)
    @bikes << bike
  end

  def count_bikes_in_van
    @bikes.count 
  end

  def release_bike(bike)
    @bikes.pop
  end
end
