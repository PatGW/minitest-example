class Van

  CAPACITY = 4

  def initialize
    @bikes = []
  end

  def receive_bike(bike)
    space_available? ? @bikes << bike : false
  end

  def count_bikes
    @bikes.count
  end

  def release_bike
    @bikes.pop
  end

  private
  
  def space_available?
    @bikes.count < CAPACITY
  end
end
