gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
  @cruiser = Ship.new("Cruiser", 3)
  end

  def test_instance_of_ships
  assert_equal Ship, @cruiser.class
  end

  def test_it_has_a_name
  assert_equal "Cruiser", @cruiser.name
  end

end
