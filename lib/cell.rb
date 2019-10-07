gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class Cell
  attr_reader :coordinate
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
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
end
