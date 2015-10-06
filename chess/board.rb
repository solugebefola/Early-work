require_relative "piece"

class Board
  attr_accessor :grid

  def self.blank_board
    blank = self.new
    blank.grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    blank
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    @selected_piece = nil
    place_starting_board
  end

  def out_of_bounds?(coordinates)
    coordinates.all? {|coord| coord.between?(0,7)}
  end

  def place_starting_board
    white_start = [Rook, Knight, Bishop, Queen,
                   King, Bishop,Knight, Rook]

    black_start = white_start
    grid.first.each_index do |idx|
      self[[0, idx]] = white_start[idx].new(nil,[0,idx], :white)
      self[[7, idx]] = black_start[idx].new(nil,[7,idx], :black)
    end

    grid[1].each_index do |idx|
      self[[1, idx]] = Pawn.new(nil, [1, idx], :white)
      self[[6, idx]] = Pawn.new(nil, [6, idx], :black)
    end

    grid.flatten.each { |piece| piece.board = self unless piece.is_a?(NullPiece) }

  end

  def move(start, end_pos)
    raise NoPieceError "no piece there" if self[start].is_a?(NullPiece)
    if self[start].possible_moves.include?(end_pos)
      update_position(start, end_pos)
    end
  end

  def update_position(start, end_pos)
    self[start].pos = end_pos
    self[end_pos] = self[start]
    self[start] = NullPiece.new
  end

  def in_check?(color)
    opp_color_pieces(color).any? do |piece|
      piece.possible_moves.include?(king_position(color))
    end
  end

  def checkmate?(color)
    all_color_pieces.all? do |piece|
      piece.possible_moves.all? { |move| self.move_into_check?(move) }
    end
  end

  def king_position(color)
    grid.flatten.each do |piece|
      return piece.pos if piece.is_a?(King) && (piece.color == color)
    end
  end

  def opp_color_pieces(color)
    color_opposite = {:black => :white , :white => :black}
    grid.flatten.select do |piece|
      piece.color == color_opposite[color]
    end
  end

  def all_color_pieces(color)
    grid.flatten.select do |piece|
      piece.color == color
    end
  end

  def select_piece(pos)
    if self[pos].is_a?(Piece)
      @selected_piece = self[pos]
    end
    @selected_piece
  end

  def inspect
    grid
  end

  def dup
    duppy = Board.blank_board
    self.grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        duppy[[row_idx,col_idx]] = el.dup(duppy) unless el.is_a?(NullPiece)
      end
    end
    duppy
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
