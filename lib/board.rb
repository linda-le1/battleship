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

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    ship_is_in_straight_line(ship, coordinates)

  end

  def ship_is_in_straight_line(ship, coordinates)
    if ship.length == coordinates.count
      letter = array.map { |coordinates| coordinates[0] }
      number = array.map { |coordinates| coordinates[1] }
      yrange = Range.new(letter.sort.first, letter.sort.last).count
      xrange = Range.new(number.sort.first, number.sort.last).count
      #horizontal placement
      if xrange == ship.length && letter.uniq.count == 1
        true
      #veritcal placement
      elsif yrange == ship.length && number.uniq.count == 1
        true
      else
        false
      end
    end
  end

  def coordinates_already_used(coordinates)
    coordinates_to_check.each do |coordinate|
      


end
