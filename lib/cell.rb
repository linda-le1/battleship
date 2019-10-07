gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

end
