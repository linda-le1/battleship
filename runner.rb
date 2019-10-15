require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'pry'

  puts "Welcome to BATTLESHIP"
  puts "Enter p to play."
  puts "Enter q to quit."
  answer = gets.chomp
  if answer == "p"
    puts "Please tell me your name"
    name = gets.chomp
    @player = Player.new(name)
    play_game
  else
    "Goodbye!"
  end

def play_game
  @board = Board.new
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
  puts "Okay #{@player.name}, I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The cruiser is 3 units long. The submarine is 2 units long."
  @board.render
  puts "Enter the squares for the Cruiser (3 spaces):"
  cruiser_coordinates = gets.chomp
  @board.ship_is_not_on_ship(@cruiser, cruiser_coordinates)
  @board.render
  puts "Enter the squares for the Submarine (2 spaces):"
  submarine_coordinates = gets.chomp
  @board.ship_is_not_on_ship(@submarine, submarine_coordinates)
  @board.render
end
