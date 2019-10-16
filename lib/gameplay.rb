require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/computer'

def setup
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
  @player_ships = [@cruiser, @submarine]
  @computer = Computer.new("Hal")
  @compcruiser = Ship.new("Computer Cruiser", 3)
  @compsubmarine = Ship.new("Computer Submarine", 2)
  @computer_ships = [@compcruiser, @compsubmarine]
end

def game_start
  puts "~*~*~ Welcome to BATTLESHIP ~*~*~"
  puts "Enter p to play."
  puts "Enter q to quit."
  answer = gets.chomp
    if answer == "p"
      puts "Hello, I'm #{@computer.name}. Please tell me your name."
      name = gets.chomp
      @player = Player.new(name)
      play_game_ready
    else
      game_over
    end
end

def play_game_ready
  puts "Okay #{@player.name}, I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The cruiser is 3 units long. The submarine is 2 units long."
  @player.enter_ship_coordinates(@cruiser)
  @player.enter_ship_coordinates(@submarine)
  @computer.cruiser_placement
  @computer.submarine_placement
  game_play
end

def game_play
    puts "\n#{@computer.name}'s Board"
    @computer.board.render
    puts "\nYour Board"
    @player.board.render
    until @player.all_ships_sunk? || @computer.all_ships_sunk? do
      @player.player_shot(@computer.board)
      puts "#{@computer.name}'s turn."
      @computer.shot_choice
      #require 'pry'; binding.pry
      @player.board.fire(@computer.shot)
      puts "#{@computer.name} guesses #{@computer.shot}"
      @computer.board.render
      @player.board.render
    end
    puts "Game over!!!"
    game_over
end

def game_over
  if @computer.all_ships_sunk?
    puts "~~~ You won! ~~~ "
  else
    puts "*** I won! ***"
  end
  puts "Would you like to play again?"
  puts "Enter p to play."
  puts "Enter q to quit."
  answer = gets.chomp
    if answer == "p"
      puts "#{@player.name}, Welcome to the next round."
      play_game_ready
    else
      puts "Goodbye!"
    end
end
