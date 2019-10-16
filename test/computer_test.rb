gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class ComputerTest < Minitest::Test
  def setup
    @hal = Computer.new("Hal")
  end

  def test_it_exists
    assert_instance_of Computer, @hal
    assert_equal "Hal", @hal.name
  end

  def test_it_has_a_board
    assert_instance_of Board, @hal.board
  end

  def test_it_gets_shot_choice_and_reduces_options_in_array_by_one
    assert_equal 16, @hal.shot_choices.length
    @hal.shot_choice
    shot_1 = @hal.shot
    assert_equal 15, @hal.shot_choices.length
    @hal.shot_choice
    shot_2 = @hal.shot
    refute shot_1 == shot_2
  end

  def test_cruiser_placement_gives_one_set_of_coordinates
    assert_equal 1, @hal.cruiser_placement.length
  end

  def test_submarine_placement_gives_one_set_of_coordinates
    assert_equal 1, @hal.submarine_placement.length
  end

  def test_all_ships_sunk?
    @hal.cruiser_placement
    @hal.submarine_placement
    assert_equal false, @hal.all_ships_sunk?
  end
end
