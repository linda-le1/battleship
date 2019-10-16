require './lib/board'
require './lib/ship'

class Player
  attr_reader :name,
              :coordinates_guessed,
              :board

  def initialize(name)
    @name = name
    @coordinates_guessed = []
    @board = Board.new
  end

  def player_shot(computer_board)
    puts "Enter a guess:"
    coordinate = gets.chomp
    if @coordinates_guessed.include?(coordinate)
      puts "You have already tried this spot. Please try again."
      player_shot(computer_board)
    elsif computer_board.valid_coordinate?(coordinate)
      computer_board.cells[coordinate].fire_upon
      @coordinates_guessed << coordinate
    else
      puts "Invalid coordinate, please try again."
      player_shot(computer_board)
    end
  end

  def enter_ship_coordinates(ship)
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    player_ship_coordinates = gets.chomp.split(", ")
    if player_ship_coordinates.length != ship.length
      enter_ship_coordinates(ship)
    end

    all_coordinates_valid = player_ship_coordinates.all? do |coordinate|
        @board.valid_coordinate?(coordinate) == true
    end

    if all_coordinates_valid && @board.ship_is_not_on_ship(ship, player_ship_coordinates) && @board.is_valid_ship_placement(ship, player_ship_coordinates)
      @board.place_ship_on_board(ship, player_ship_coordinates)
    else
      puts "Invalid coordinates. Please try again."
      enter_ship_coordinates(ship)
    end
  end

  def all_ships_sunk?
    # require 'pry'; binding.pry
    @board.ships_placed.flatten.all? do |coordinate|
      @board.cells[coordinate].fired_upon_status == true
    end
  end
end
