class Player
  attr_reader :name, :coordinates_guessed
  def initialize(name)
    @name = name
    @coordinates_guessed = []
  end

  def player_guess(coordinate)
    if @coordinates_guessed.include?(coordinate) == true
      puts "You have already tried this spot."
    else
      @coordinates_guessed << coordinate
    end
  end
end
