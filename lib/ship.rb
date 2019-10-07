gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class Ship
attr_reader :name, :length
  def initialize(name, length)
    @name = name
    @length = length
  end
end
