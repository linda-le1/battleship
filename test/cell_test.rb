gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_is_a_cell
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_cell_is_empty
    assert_equal true, @cell.empty?
  end

  def test_it_has_a_ship
    assert_equal true, @cell.empty?
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.empty?
    assert_equal @cruiser, @cell.ship.first
  end

  def test_it_can_be_fired_upon
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.fired_upon?
  end

  def test_it_is_fired_upon
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
    assert_equal 2, @cell.ship.first.health
  end

  def test_the_render_method
    cell_1 = Cell.new("C3")
    assert_equal ".", cell_1.render
    cell_1.place_ship(@cruiser)
    assert_equal "S", cell_1.render(true)
    cell_1.fire_upon
    assert_equal "H", cell_1.render(true)
  end

end
