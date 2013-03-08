require './lib/location'

class Station < Location

    CAPACITY = 20

  def initialize
    @bikes = []
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
