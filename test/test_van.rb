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
    @van<<@bike
    assert_equal( 1, @van.count_bikes)
  end

  def test_van_can_release_bike
    @van<<(@bike)
    @van.release_bike(@bike)
    assert_equal( 0, @van.count_bikes)
  end


  def test_exception_if_van_doesnt_have_bike_it_has_been_asked_to_release
    assert_raises(RuntimeError){
      @van.release_bike(Bike.new) 
    }
  end

  def test_van_capacity_returns_false_once_reached
    Van::CAPACITY.times { @van<<Bike.new }      
    assert_raises(RuntimeError){
      @van<<Bike.new
    }
  end
end