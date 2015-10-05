require_relative "piece"

class Board
  attr_accessor :grid

  def initialize

    @grid = Array.new(8) { Array.new(8) {nil} }
    place_starting_board
  end

  def place_starting_board
    white_start = [Rook.new, Knight.new, Bishop.new,
                   King.new, Queen.new, Bishop.new,
                   Knight.new, Rook.new]
    black_start = white_start.reverse
    grid.first.each_index do |idx|
      grid[0][idx] = white_start[idx]
      grid[7][idx] = black_start[idx]
    end

    grid[1].each_index do |idx|
      grid[1][idx] = Pawn.new
      grid[6][idx] = Pawn.new
    end      

  end

  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x,y = pos
    grid[x][y] = piece
  end

end
