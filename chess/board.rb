require_relative "piece"

class Board
  attr_accessor :grid

  def initialize

    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }

    place_starting_board
  end

  def out_of_bounds?(coordinates)
    coordinates.all? {|coord| coord.between?(0,7)}
  end

  def place_starting_board
    white_start = [Rook, Knight, Bishop,King,
                   Queen, Bishop,Knight, Rook]

    black_start = white_start.reverse
    grid.first.each_index do |idx|
      self[[0, idx]] = white_start[idx].new(nil,[0,idx], :white)
      self[[7, idx]] = black_start[idx].new(nil,[7,idx], :black)
    end

    grid[1].each_index do |idx|
      self[[1, idx]] = Pawn.new(nil, [1, idx], :white)
      self[[6, idx]] = Pawn.new(nil, [6, idx], :black)
    end

    grid.flatten.each { |piece| piece.board = self unless piece.is_a?(NullPiece) }
    p self

  end

  def move(start, end_pos)
    if self[start].is_a?(Piece)
      moving_piece = self[start]
      if moving_piece.movable?(end_pos)
         self[end_pos] = moving_piece
         self[start] = nil
      end
    else
      raise EmptySpaceError.new "No piece at start position"
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
