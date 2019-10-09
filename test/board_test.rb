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
end
