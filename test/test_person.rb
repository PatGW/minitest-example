# the class under test
require './lib/person'
require './lib/bike'
require 'minitest/autorun'
require './lib/station'
# the minitest itself
# require 'ansi' # makes it colored
# require 'turn' # improves the default output

class TestPerson < MiniTest::Unit::TestCase

  def setup
    @person = Person.new
    @bike = Bike.new
  end

  def test_person_can_take_bike
    @person.take_bike(@bike)
    assert @person.has_bike?
  end

  def test_person_can_return_bike
    @person.return_bike(@bike)
    refute @person.has_bike?
  end

end

