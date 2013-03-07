require './lib/station' # the class under test
require './lib/bike'
require 'minitest/autorun' # the minitest itself
# require 'ansi' # makes it colored
# require 'turn' # improves the default output


class TestStation < MiniTest::Unit::TestCase

  def setup
    @station = Station.new
    @bike = Bike.new
    @bikes = [Bike.new, Bike.new, Bike.new]
  end

  def test_station_can_receive_a_bike
    @station.receive_bike(@bike)
    assert @station.count_bikes_in_station == 1
  end

  def test_station_can_release_a_bike
    @station.release_bike(@bike)
    assert @station.count_bikes_in_station == 0
  end

  def test_station_has_working_bikes
    add_bikes
    assert @station.working_bikes_count == 3
  end

  def test_station_has_broken_bikes
    break_bikes
    add_bikes
    assert @station.broken_bikes_count == 3 
  end

  private

  def add_bikes
    @bikes.each {|bike| @station.receive_bike(bike)}
  end

  def break_bikes
    @bikes.each {|bike| bike.break!}
  end


  # def test_station_can_receive_working_bike
  #   @station.receive_bike(@bike)
  #   if @bike.broken?
  #     assert @station.broken_bikes == [@bike]
  #   elsif @bike.broken? == false
  #     assert @station.working_bikes == [@bike]
  #   end
  # end

end
