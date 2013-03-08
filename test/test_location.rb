require './lib/location' 
require './lib/bike'# the class under test
require 'minitest/autorun'

class TestLocation < MiniTest::Unit::TestCase

  def setup 
    @bike = Bike.new
    @location = Location.new
  end

  def test_locations_can_receive_bikes
    @location<<@bike
    assert_equal(1, @location.count_bikes)
  end
end
