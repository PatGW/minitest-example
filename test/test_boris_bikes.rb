require './lib/boris_bikes' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestBorisBikes < MiniTest::Unit::TestCase

  def setup   
    # @station = Station.new
    # @people = Array.new(10) { Person.new }
    # @van = Van.new
    # @garage = Garage.new
    @boris_bike = BorisBikes.new
    # @bike = Bike.new
  end

  def test_people_take_bikes
    # there should be no people with @bike = nil
    assert @boris_bike.people.all? {|person| !person.has_bike? }
    @boris_bike.people_take_bikes
    assert @boris_bike.people.each {|person| person.has_bike? }
    # assert_equal(0, people.count {|person| person.has_bike? = nil})
  end

  def test_van_moves_bikes_between_station_and_garage
    # Add 10 broken bikes to station
    # for where station has broken bikes collect and move to van then garage
    station = @boris_bike.stations.first
    10.times {station << Bike.new.break!}  
    van =@boris_bike.vans.first
    garage = @boris_bike.garages.first
    assert_equal 0, garage.count_bikes
    @boris_bike.van_moves_bikes_between_station_and_garage(station, van, garage)
    assert_equal(10, garage.count_bikes)
  end

  def test_van_moves_bikes_between_garage_and_station
    garage = @boris_bike.garages.first
    10.times {garage << Bike.new}  
    van =@boris_bike.vans.first
    station = @boris_bike.stations.first
    assert_equal 10, garage.count_bikes
    @boris_bike.van_moves_bikes_between_garage_and_station(garage, van, station)
    assert_equal(10, station.count_bikes)
  end

  def test_van_moves_bikes_from_station_to_garage_when_there_are_fixed_bikes_at_the_garage

  end

  def test_van_moves_bikes_from_station_to_garage_when_there_are_fixed_bikes_at_the_garage

  end

  def test_van_moves_bikes_from_station_to_station_to_level_the_load_if_there_are_no_bikes_to_fix

  end

  def test_people_return_bikes
    @boris_bike.people.each {|person| person.take_bike(Bike.new)}
    @boris_bike.people_return_bikes
    @boris_bike.people.each do |person|
      refute person.has_bike?
    end
  end

  def test_stations_with_bikes_are_created

  end

  def test_people_are_created
    refute @boris_bike.people == nil
  end

  def test_van_is_created
    refute @boris_bike.vans == nil
  end

  def test_garage_is_created
    refute @boris_bike.garages == nil
  end
end