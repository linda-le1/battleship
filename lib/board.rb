require './lib/ship'
require './lib/cell'
require './lib/player'

class Board
  attr_reader :cells,
              :ships_placed

  def initialize
    @cells = {
   "A1" => Cell.new("A1"),
   "A2" => Cell.new("A2"),
   "A3" => Cell.new("A3"),
   "A4" => Cell.new("A4"),
   "B1" => Cell.new("B1"),
   "B2" => Cell.new("B2"),
   "B3" => Cell.new("B3"),
   "B4" => Cell.new("B4"),
   "C1" => Cell.new("C1"),
   "C2" => Cell.new("C2"),
   "C3" => Cell.new("C3"),
   "C4" => Cell.new("C4"),
   "D1" => Cell.new("D1"),
   "D2" => Cell.new("D2"),
   "D3" => Cell.new("D3"),
   "D4" => Cell.new("D4")
  }
    @ships_placed = []
  end

  # def make_board
  #   @cells = {
  #  "A1" => Cell.new("A1"),
  #  "A2" => Cell.new("A2"),
  #  "A3" => Cell.new("A3"),
  #  "A4" => Cell.new("A4"),
  #  "B1" => Cell.new("B1"),
  #  "B2" => Cell.new("B2"),
  #  "B3" => Cell.new("B3"),
  #  "B4" => Cell.new("B4"),
  #  "C1" => Cell.new("C1"),
  #  "C2" => Cell.new("C2"),
  #  "C3" => Cell.new("C3"),
  #  "C4" => Cell.new("C4"),
  #  "D1" => Cell.new("D1"),
  #  "D2" => Cell.new("D2"),
  #  "D3" => Cell.new("D3"),
  #  "D4" => Cell.new("D4")
  # }
  # end

  #ship placed array
  #validate all ship placements
  #shovel/ if does not include coordinates, go ahead and place ship
  #if does include coordinates, fail

  def ship_is_not_on_ship(ship, coordinates)
    check = coordinates.all? do |coordinate|
      @cells[coordinate].ship == nil
    end
    check
  end

  def place_ship_on_board(ship, coordinates)
    if ship_is_not_on_ship(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  # def ship_check(ship,coordinates)
  #   ship_is_not_on_ship(ship, coordinates) && ship_placement(ship, coordinates) == true
  # end

  def valid_coordinate?(coordinates)
    @cells.include?(coordinates)
  end

  def is_valid_ship_placement(ship, coordinates)
    numbers_permutations(ship)
    letters_permutations(ship)

    letter = coordinates.map { |coordinates| coordinates[0] }
    number = coordinates.map { |coordinates| coordinates[1].to_i }
    coordinates_in_ordinal = []

    letter.each do |letter|
      coordinates_in_ordinal << letter.ord
    end

    if !valid_coordinate?(coordinates)
      false
    end

    # letters_inside_board = @x.flatten.uniq
    # numbers_inside_board = @y.flatten.uniq
    # if !(coordinates_in_ordinal - letters_inside_board).empty?
    #   false
    # end
    # if !(number - numbers_inside_board).empty?
    #   false
    # end

    if ship.length == coordinates.length
      ship_valid = false
      if diagonal_check(ship, coordinates) == true && @x.include?(coordinates_in_ordinal) == true
        ship_valid = true
      end
      if diagonal_check(ship, coordinates) == true && @y.include?(number) == true
        ship_valid = true
      end
      ship_valid
    else
      false
    end
    # ship_check(ship, coordinates)
    # ship_is_not_on_ship(ship, coordinates)
  end

  def letters_permutations(ship)
    @x = []
    (65..68).each_cons(ship.length) { |a| @x << a }
    (65..68).each { |a| @x << Array.new(ship.length, a) }
    @x
  end

  def numbers_permutations(ship)
    @y = []
    (1..4).each_cons(ship.length) { |a| @y << a }
    @y
  end

  def diagonal_check(ship, coordinates)
    letter = coordinates.map { |coordinates| coordinates[0] }
    number = coordinates.map { |coordinates| coordinates[1] }
    if ship.length == coordinates.length
      if number.uniq.count == ship.length && letter.uniq.count == 1 && is_consecutive_numbers(number)
        true
      elsif letter.uniq.count == ship.length && number.uniq.count == 1 && is_consecutive_letters(letter)
        true
      else
        false
      end
    else
      false
    end
  end

  def is_consecutive_numbers(numbers)
    numbers = numbers.sort
    numbers.each_cons(2).all? { |a, b| b.to_i == a.to_i + 1 }
  end

  def is_consecutive_letters(letters)
    letters = letters.sort
    letters.each_cons(2).all? { |a, b| b.ord == a.ord + 1 }
  end

  def render(status = false)
    puts " "
    puts "  1 2 3 4\nA " + @cells["A1"].render(status) + " " + @cells["A2"].render(status) + " " + @cells["A3"].render(status) + " " + @cells["A4"].render(status)
    puts "B " + @cells["B1"].render(status) + " " + @cells["B2"].render(status) + " " + @cells["B3"].render(status) + " " + @cells["B4"].render(status)
    puts "C " + @cells["C1"].render(status) + " " + @cells["C2"].render(status) + " " + @cells["C3"].render(status) + " " + @cells["C4"].render(status)
    puts "D " + @cells["D1"].render(status) + " " + @cells["D2"].render(status) + " " + @cells["D3"].render(status) + " " + @cells["D4"].render(status)
  end

  def fire(coordinate)
    @cells[coordinate].fire_upon
  end
end
