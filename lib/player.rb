require './lib/board'

class Player
  attr_reader :name,
              :coordinates_guessed,
              :board

  def initialize(name)
    @name = name
    @coordinates_guessed = []
    @board = Board.new
  end

  def player_shot(coordinate, board)
    if @coordinates_guessed.include?(coordinate)
      puts "You have already tried this spot."
    elsif board.valid_coordinate?(coordinate)
      board.cells[coordinate].fire_upon
      @coordinates_guessed << coordinate
    else
      puts "Invalid coordinate please try again."
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

    if all_coordinates_valid
      @board.ship_is_not_on_ship(ship, player_ship_coordinates)
    else
      enter_ship_coordinates(ship)
    end
  end


end
