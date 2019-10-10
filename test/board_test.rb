gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_assert_instance_of
    assert_instance_of Board, @board
  end
  def test_it_has_cells
    assert_equal 16, @board.cells.count
  end

  def test_if_valid_coordinate?
    assert_equal true, @board.valid_coordinate?("B4")
    assert_equal false, @board.valid_coordinate?("F4")
    assert_equal false, @board.valid_coordinate?("A8")
  end

  def test_ship_placement
    assert_equal false, @board.ship_placement(@cruiser, ["A1", "B1", "C1", "D1"])
    assert_equal true, @board.ship_placement(@cruiser, ["A1", "B1", "C1"])
    assert_equal false, @board.ship_placement(@cruiser, ["A1", "B1", "B2"])
    assert_equal false, @board.ship_placement(@submarine, ["B8", "B2"])
    assert_equal false, @board.ship_placement(@submarine, ["A1", "C3"])
    assert_equal true, @board.ship_placement(@submarine, ["C4", "D4"])
    assert_equal true, @board.ship_placement(@submarine,["C1", "C2"])
    assert_equal true, @board.ship_placement(@cruiser, ["B1", "B2", "B3"])
  end

  def test_permutations
    x = @board.permutations(@submarine)
    y = @board.numbers_permutations(@submarine)
  end

end
# binding.pry
