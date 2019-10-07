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

  def test_it_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_it_has_health
    assert_equal 3, @cruiser.health
  end

  def test_if_sunk
    assert_equal false, @cruiser.sunk?
  end
end
