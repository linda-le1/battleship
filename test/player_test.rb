gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require 'pry'

class PlayerTest < MiniTest::Test
  def test_player_exists
    player = Player.new("Andy")
    assert_instance_of Player, player
  end

  def test_player_has_name
    player = Player.new("Andy")
    assert_equal "Andy", player.name
  end

  def test_it_stores_guesses
    player = Player.new("Andy")
    assert_equal [], player.coordinates_guessed
    player.player_guess("A1")
    player.player_guess("B4")
    assert_equal 2, player.coordinates_guessed.count
  end
end
