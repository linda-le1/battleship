class Board
  attr_reader :cells
  def initialize
    @cells = make_board
  end
  def make_board
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
  end

  def valid_coordinate?(coordinates)
    @cells.include?(coordinates)
  end

  # def ship_placement(ship, coordinates)
    # letter = coordinates.map { |coordinates| coordinates[0] }
    # number = coordinates.map { |coordinates| coordinates[1] }
    # coordinates_in_ordinal = []
    # letter.each do |letter|
    #   coordinates_in_ordinal << letter.ord
    # end
  #   diagonal_check(ship, coordinates) == true
  #   valid_coordinate?(coordinates) == true
  #     if permutations(ship).include?(coordinates_in_ordinal) || numbers_permutations(ship).include?(number)
  #       true
  #     else
  #       false
  #     end
  # end

  def ship_placement(ship, coordinates)
    numbers_permutations(ship)
    letters_permutations(ship)

    letter = coordinates.map { |coordinates| coordinates[0] }
    number = coordinates.map { |coordinates| coordinates[1].to_i }
    coordinates_in_ordinal = []
    letter.each do |letter|
      coordinates_in_ordinal << letter.ord
    end

    # check if coordinates are outside the board
    letters_inside_board = @x.flatten.uniq
    numbers_inside_board = @y.flatten.uniq
    if !(coordinates_in_ordinal - letters_inside_board).empty?
      return false
    end
    if !(number - numbers_inside_board).empty?
      return false
    end

    if ship.length == coordinates.length
      ship_valid = false
      # check if coordinates are diagonals
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
  # def coordinates_already_used(coordinates)
  #  coordinates_to_check.each do |coordinate|

  def diagonal_check(ship, coordinates)
    letter = coordinates.map { |coordinates| coordinates[0] }
    number = coordinates.map { |coordinates| coordinates[1] }
    if ship.length == coordinates.length
      if number.uniq.count == ship.length && letter.uniq.count == 1
        true
      elsif letter.uniq.count == ship.length && number.uniq.count == 1
        true
      else
        false
      end
    else
      false
    end
  end
end
