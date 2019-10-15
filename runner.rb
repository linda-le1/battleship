require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/computer'
require 'pry'

def setup
@cruiser = Ship.new("Cruiser", 3)
@submarine = Ship.new("Submarine", 2)
@compcruiser = Ship.new("Computer Cruiser", 3)
@compsubmarine = Ship.new("Computer Submarine", 2)
@player_ships = [@cruiser, @submarine]
@computer = Player.new("Hal")
# # @computer.board.ship_is_not_on_ship(@compcruiser, ["B1", "C1", "D1"])
# @computer.board.ship_is_not_on_ship(@compsubmarine, ["C3", "D3A"])
@computer_ships = [@compcruiser, @compsubmarine]

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
    game_over
  end
end

def play_game_ready
  puts "Okay, I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The cruiser is 3 units long. The submarine is 2 units long."
  @player.enter_ship_coordinates(@cruiser)
  @player.enter_ship_coordinates(@submarine)
  game_play
end

def game_play
    puts "#{@computer.name}'s Board"
    @computer.board.render
    puts "Your Board"
    @player.board.render
    all_player_sunk = @player_ships.all? do |ship|
      ship.sunk? == false
    end
    all_computer_sunk = @computer_ships.all? do |ship|
      ship.sunk? == false
    end
    until !all_player_sunk || !all_computer_sunk do
      puts "Enter a guess:"
      coordinate = gets.chomp
      @player.player_shot(coordinate, @computer.board)
      @computer.board.fire(coordinate)
      puts "#{@computer.name}'s turn."
      @computer.shot_choice
      binding.pry
      puts "#{@computer.name} guesses #{@computer.shot}"
      @player.board.fire(@computer.shot)
      @computer.board.render
      @player.board.render
    end
      puts "Game over!"
end

def game_over
 puts   "Goodbye!"
end


setup
game_start
