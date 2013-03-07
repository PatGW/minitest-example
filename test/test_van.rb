require './lib/station' # the class under test
require './lib/bike'
require 'minitest/autorun'
require './lib/van'
require './lib/bike'
 # the minitest itself
# require 'ansi' # makes it colored
# require 'turn' # improves the default output

class TestVan < MiniTest::Unit::TestCase

  def setup
    @van = Van.new
    @bike = Bike.new
  end

  def test_van_can_receive_a_bike
    @van.receive_bike(@bike)
    assert_equal( 1, @van.count_bikes)
  end

  def test_van_can_release_bike
    raise "don't release just any bike, please pass the bike you want to be released"
    raise "and throw an exception if you don't have the bike in question (a separate test)"
    @van.release_bike
    assert_equal( 0, @van.count_bikes)
  end

  def test_van_capacity_returns_false_once_reached
    raise "make the van throw an exception if it's at capacity instead of returning false"
    Van::CAPACITY.times { @van.receive_bike(Bike.new) }      
    assert @van.receive_bike(Bike.new) == false
  end
end