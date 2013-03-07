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
    assert @van.count_bikes_in_van == 1
  end

  def test_van_can_release_bike
    @van.release_bike(@bike)
    assert @van.count_bikes_in_van == 0
  end
end
