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
end
