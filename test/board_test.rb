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

  def test_ship_properly_placed
    assert_equal true, @board.is_valid_ship_placement(@cruiser, ["A1", "B1", "C1"])
    assert_equal true, @board.is_valid_ship_placement(@submarine, ["C4", "D4"])
    assert_equal true, @board.is_valid_ship_placement(@submarine,["C1", "C2"])
    assert_equal true, @board.is_valid_ship_placement(@cruiser, ["B1", "B2", "B3"])
  end

  def test_ship_cannot_be_too_long
    assert_equal false, @board.is_valid_ship_placement(@cruiser, ["A1", "B1", "C1", "D1"])
    assert_equal false, @board.is_valid_ship_placement(@submarine, ["D1", "D2", "D3"])
  end

  def test_ship_cannot_be_placed_in_an_l_shape
    assert_equal false, @board.is_valid_ship_placement(@cruiser, ["A1", "B1", "B2"])
    assert_equal false, @board.is_valid_ship_placement(@cruiser, ["D1", "D2", "C2"])
  end

  def test_ship_cannot_have_spaces_between_assigned_spaces
    assert_equal false, @board.is_valid_ship_placement(@submarine, ["A1", "C3"])
    assert_equal false, @board.is_valid_ship_placement(@submarine, ["B1", "D1"])
  end

  def test_ship_cannot_be_placed_off_the_board
    assert_equal false, @board.valid_coordinate?(["Z1", "Z2"])
    assert_equal false, @board.valid_coordinate?(["B8", "B2"])
  end

  def test_ship_cannot_be_placed_diagonally
    assert_equal false, @board.is_valid_ship_placement(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.is_valid_ship_placement(@submarine, ["C3", "D4"])
  end

  def test_ship_is_not_on_ship
    @board.place_ship_on_board(@cruiser, ["A1", "B1", "C1"])
    assert_equal false, @board.cells["A1"].empty?
    assert_equal false, @board.cells["B1"].empty?
    assert_equal false, @board.cells["C1"].empty?
    assert_equal true, @board.cells["D1"].empty?
  end

  def test_render
    @board.render
    @board.place_ship_on_board(@submarine, ["A1", "A2"])
    assert_equal false, @board.cells["A1"].empty?
    @board.render(true)
  end

  def test_fire_at_ship_shows_on_board
    @board.render
    @board.ship_is_not_on_ship(@submarine, ["B3", "C3"])
    @board.render(true)
    @board.fire("D4")
    @board.fire("B3")
    @board.render
    @board.render(true)
  end

  def test_ship_sinks
    @board.render
    @board.ship_is_not_on_ship(@submarine, ["B3", "C3"])
    @board.render(true)
    @board.fire("C3")
    @board.render
    @board.fire("B3")
    @board.render
    @board.render(true)
  end
end
