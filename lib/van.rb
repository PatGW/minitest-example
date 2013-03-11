require './lib/location'

class Van < Location

  CAPACITY = 10


  # def working_bikes
  #   @bikes.select { |bike| !bike.broken? }
  # end

  # def broken_bikes
  #   @bikes.select { |bike| bike.broken? }
  # end

  private
  
  def space_available?
    @bikes.count < CAPACITY
  end
end
