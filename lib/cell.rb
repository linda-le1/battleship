gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class Cell
  attr_reader :coordinate
  attr_accessor :ship, :fired_upon_status

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
    @fired_upon_status = false
  end

  def ship
    @ship
  end

  def empty?
    @ship == []
  end

  def place_ship(ship_to_be_placed)
    @ship << ship_to_be_placed
  end

  def fired_upon?
    @fired_upon_status
  end

  def fire_upon
    @fired_upon_status = true
    if @ship != nil
      @ship.first.health -= 1
    end
  end

  def render(value = false)
    if value == true
      if @ship.first == nil && @fired_upon_status == false
        "."
      elsif @ship.first == nil && @fired_upon_status == true
        "M"
      elsif @ship.first != nil && @fired_upon_status == true && @ship.first.health == 0
        "X"
      elsif @ship.first != nil && @fired_upon_status == false
        "S"
      elsif @ship.first != nil && @fired_upon_status == true
        "H"
      end
    else
      if @ship.first == nil && @fired_upon_status == false
        "."
      elsif @ship.first == nil && @fired_upon_status == true
        "M"
      elsif @ship.first != nil && @fired_upon_status == true && @ship.first.health == 0
        "X"
      elsif @ship.first != nil && @fired_upon_status == false
        "."
      elsif @ship.first != nil && @fired_upon_status == true
        "H"
      end
    end
  end

end
