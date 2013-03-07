class Station

    CAPACITY = 20

  def initialize
    @bikes = []
  end

  def count_bikes_in_station
    @bikes.count
  end

  def receive_bike(bike)
    if space_available? 
      @bikes << bike
    else
      raise "No room for Bikes at Station"
    end
  end

  def release_bike(bike)
    @bikes.pop
  end

  def working_bikes_count
    @bikes.count {|bike| !bike.broken? }
  end

  def broken_bikes_count
    @bikes.count { |bike| bike.broken? }
  end

  private

  def space_available?
    @bikes.count < CAPACITY
  end
end
