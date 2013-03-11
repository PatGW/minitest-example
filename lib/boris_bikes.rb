
require './lib/person.rb'
require './lib/bike.rb'
require './lib/van.rb'
require './lib/station.rb'
require './lib/garage.rb'

class BorisBikes

  attr :people, :garages, :stations, :vans

  def initialize(people=10, bikes=10, vans=1, garages=1, stations=1)
    # @stations = stations_with_bikes
    @people = Array.new(people) { Person.new }
    @bikes = Array.new(bikes) { Bike.new }
    @vans = Array.new(vans) { Van.new }
    @garages = Array.new(garages) { Garage.new }
    @stations = Array.new(stations) { Station.new }
  end

  def run
    people_take_bikes
    van_moves_bikes_between_garage_and_stations
    people_return_bikes  
  end

    def report
    report = []
    report << "We have #{@stations.count} stations:"
    puts "REPORT"
    # @stations.each {|s| reports << s.to_s}
    # # and so on: people, van, garage
    # report
    van_moves_bikes_user_generated
  end

  def people_take_bikes
    non_bikers = @people.select {|person| person.has_bike? == false }
    non_bikers.each {|person| person.take_bike(@stations.first.working_bikes.pop)}
    # Only checks FIRST STATION for working bikes
  end

  def people_return_bikes
    @people.each { |person| person.return_bike }
  end

  def van_moves_bikes_between_station_and_garage(station, van, garage)
    station.broken_bikes.each {|bike| van << station.release_bike(bike)}
    van.bikes.dup.each {|bike| garage << van.release_bike(bike)}
  end

  def van_moves_bikes_between_garage_and_station(garage, van, station)
    garage.bikes.dup.each {|bike| van << garage.release_bike(bike)}
    van.bikes.dup.each {|bike| station << van.release_bike(bike)}
  end

private

  def van_moves_bikes_user_generated
    # decide where to move bikes from and to
    # a van can make only one move per run: either between stations to level capacity or from garage to station or from station to garage
    # this method is likely to call several other methods (yet to be written)
    # van = gets.chomp("Which Van do you want to use?:")
    # pickup = gets.chomp("Which location do you want to pick up from")
    # dropoff = gets.chomp("Which location do you want to deliver to?:")
    # van_moves_bikes_between_station_and_garage(pickup, van, dropoff)
  end

end


#  boris_bikes = BorisBikes.new()
# puts boris_bikes.report
# 5.times do  
#   boris_bikes.run
#   puts boris_bikes.report
# end
