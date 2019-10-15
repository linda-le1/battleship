require './lib/board'

class Computer
  attr_reader :name

  def initialize(name)
    @name = name
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
    possible_cruiser_placement.sample
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
    possible_submarine_placement.sample

    "A1", "B1", "C1", "D1"
end
