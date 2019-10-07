gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_is_a_cell
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinate
    assert_equal "B4", @cell.coordinate
  end
end
