require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'pry'

def setup
@cruiser = Ship.new("Cruiser", 3)
@submarine = Ship.new("Submarine", 2)
@player_cruiser_coordinates = []
end

def game_start
puts "Welcome to BATTLESHIP"
puts "Enter p to play."
puts "Enter q to quit."
answer = gets.chomp
if answer == "p"
  puts "Please tell me your name"
  name = gets.chomp
  @player = Player.new(name)
  play_game_ready
else
  "Goodbye!"
end
end

def play_game_ready
  puts "Okay, I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The cruiser is 3 units long. The submarine is 2 units long."
  @player.enter_ship_coordinates(@cruiser)
  # player_cruiser_coordinates = gets.chomp
  # @used_coordinates = []
  # player_cruiser_coordinates.split(", ").each do |coordinate|
  #   @used_coordinates << coordinate
  #   @used_coordinates
  # end
  # all_coordinates_valid? = @used_coordinates.all? do |coordinate|
  #     @player.board.valid_coordinate? == true
  # end
  #   if all_coordinates_valid?
  #     @player.board.ship_is_not_on_ship(@cruiser, @used_coordinates)
  #   else
  # @player.enter_submarine_coordinates(@submarine)
  # puts "Enter the squares for the Submarine (2 spaces):"
  # player_submarine_coordinates = gets.chomp
  # @used_coordinates = []
  # player_submarine_coordinates.split(", ").each do |coordinate|
  #   @player.board.ships_placed << coordinate
  #   # binding.pry
  #   @used_coordinates << coordinate
  #   @used_coordinates
  # end
  @player.board.ship_is_not_on_ship(@submarine, @used_coordinates)
  game_play
end

def game_play

    while @ship.sunk? == false
      puts "Enter a guess:"
      @player.player_guess(coordinate)
    end
      puts "Game over!"
end

def computer_player
  @computer = Player.new("Hal")
  @computer.board.ship_is_not_on_ship(@cruiser, @computer.cruiser_placement)
  @computer.board.ship_is_not_on_ship(@submarine, @computer.submarine_placement)
end


setup
game_start
play_game_ready
