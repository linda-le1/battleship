require './lib/board'
require './lib/cell'
require './lib/ship'

class Computer
  attr_reader :name, :board, :shot, :shot_choices

  def initialize(name)
    @name = name
    @board = Board.new
    @guessed_coordinates = []
    @shot_choices = ["A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]
  end

  def shot_choice

    @shot = @shot_choices.delete(@shot_choices.sample)
    @shot_choices
  end

  def cruiser_placement
    possible_cruiser_placement = [["A1", "A2", "A3"], ["A2", "A3", "A4"],
                                  ["B1", "B2", "B3"], ["B2", "B3", "B4"],
                                  ["C1", "C2", "C3"], ["C2", "C3", "C4"],
                                  ["D1", "D2", "D3"], ["D2", "D3", "D4"],
                                  ["A1", "B1", "C1"], ["B1", "C1", "D1"],
                                  ["A2", "B2", "C2"], ["B2", "C2", "D2"],
                                  ["A3", "B3", "C3"], ["B3", "C3", "D3"],
                                  ["A4", "B4", "C4"], ["B4", "C4", "D4"]]
    cruiser_coordinates = possible_cruiser_placement.sample
    ship =  Ship.new("Computer Cruiser", 3);
    @board.place_ship_on_board(ship, cruiser_coordinates)
  end

  def submarine_placement
    possible_submarine_placement = [["A1", "A2"], ["A2", "A3"], ["A3", "A4"],
                                    ["B1", "B2"], ["B2", "B3"], ["B3", "B4"],
                                    ["C1", "C2"], ["C2", "C3"], ["C3", "C4"],
                                    ["D1", "D2"], ["D2", "D3"], ["D3", "D4"],
                                    ["A1", "B1"], ["B1", "C1"], ["C1", "D1"],
                                    ["A2", "B2"], ["B2", "C2"], ["C2", "D2"],
                                    ["A3", "B3"], ["B3", "C3"], ["C3", "D3"],
                                    ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]
    submarine_coordinates = possible_submarine_placement.sample
    ship = Ship.new("Computer Submarine", 2)
    if @board.ship_is_not_on_ship(ship, submarine_coordinates) != true
      submarine_placement
    else @board.place_ship_on_board(ship, submarine_coordinates)
    end
  end

  def all_ships_sunk?
    @board.ships_placed.flatten.all? do |coordinate|
      @board.cells[coordinate].fired_upon_status == true
    end
  end
end
