class Station

  # attr_reader :working_bikes, :broken_bikes

  def initialize
    @bikes = []
  end

  def count_bikes_in_station
    @bikes.count
  end


  def receive_bike(bike)
     @bikes << bike
  end

  def release_bike(bike)  
    @bikes.pop
  end

  def working_bikes_count
    working_bikes =  @bikes.select {|bike| bike.broken? == false}
    working_bikes.count
  end

  def broken_bikes_count
    broken_bikes = @bikes.select { |bike| bike.broken? }
    puts broken_bikes.inspect
    puts broken_bikes.count
    broken_bikes.count
  end
end



# def release_bikes(bike_state)
#   if bike_state = "broken"
#     @broken_bikes.first
#   else
#     bike_state = "Not Broken"
#     @working_bikes.first
#   end
# end

    # if bike.broken?
    #   @broken_bikes << bike
    # elsif !bike.broken?
    #   @working_bikes << bike
    # end 