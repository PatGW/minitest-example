require './lib/station' # the class under test
require './lib/bike'
require 'minitest/autorun' # the minitest itself
# require 'ansi' # makes it colored
# require 'turn' # improves the default output


class TestStation < MiniTest::Unit::TestCase

  def setup
    @station = Station.new    
    @station2 = Station.new
    @bike = Bike.new
    @bikes = [Bike.new, Bike.new, Bike.new]
  end

  def test_station_can_receive_a_bike
    @station.receive_bike(@bike)
    assert_equal 1, @station.count_bikes_in_station
  end

  def test_station_can_release_a_bike
    @station.receive_bike(@bike)
    @station.release_bike(@bike)
    assert_equal( 0, @station.count_bikes_in_station)
  end

  def test_station_has_working_bikes
    add_bikes(@station)
    assert_equal(3, @station.working_bikes_count)
  end

  def test_station_has_broken_bikes
    break_bikes
    add_bikes(@station)
    assert_equal(3, @station.broken_bikes_count)
  end

  def test_station_limits_capacity
    Station::CAPACITY.times {@station.receive_bike(Bike.new)}
    assert_raises(RuntimeError){@station.receive_bike(Bike.new) == false}
  end

  private

  def add_bikes(station)
    @bikes.each {|bike| station.receive_bike(bike)}
  end

  def break_bikes
    @bikes.each {|bike| bike.break!}
  end
end
