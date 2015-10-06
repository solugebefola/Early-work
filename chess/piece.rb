class Piece
  attr_reader :color
  attr_accessor :pos, :board

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def legal_moves(end_pos)
    raise ImpossibleMoveError unless possible_moves.include?(end_pos)
    x_end, y_end = end_pos
    x_start, y_start = pos
    possible_moves.select do |(x, y)|
      x.between?(*[x_start, x_end].sort) && y.between?(*[y_start, y_end].sort)
    end
  end

  # def update_pos(new_pos)
  #   @pos = new_pos
  # end

end

class NullPiece

  def initialize(color = nil)
    @color = color
  end

  def present?
    false
  end

  def to_s
    "   "
  end
end

class SlidingPiece < Piece
  def possible_moves
   possibles = []
   self.class::MOVES.each do|(dx,dy)|
    i = 0
    until i > 7
      i += 1
      x, y = pos
      candidate = [x + (dx * i), y + (dy * i)]
      next if board.out_of_bounds?(candidate)

      case board[candidate].color
      when nil
        possibles << candidate
      when self.color
        i = 8
      else
        possibles << candidate
        i = 8
      end

    end
   end

end
  # def diag_possible_moves
  #   possibles = []
  #   i = 1
  #   until i > 7
  #     [-1,1].each do |j|
  #       [-1,1].each do |k|
  #         x, y = pos
  #         candidate = [x + (i * j) , y + (i * k)]
  #         possibles << candidate
  #       end
  #     end
  #     i += 1
  #   end
  #   possibles.select{|coor| coor.all?{|el| el.between?(0,7)}}
  # end

  # def straight_possible_moves
  #   possibles = []
  #   i = 1
  #   until i > 7
  #     x, y = pos
  #     [-1,1].each do |k|
  #       candidate_x = [x + (i * k) , y]
  #       candidate_y = [x , y + (i * k)]
  #       (possibles << candidate_x) << candidate_y
  #     end
  #     i += 1
  #   end
  #   possibles.select{|coor| coor.all?{|el| el.between?(0,7)}}
  # end

end

class SteppingPiece < Piece

  def possible_moves
    possibles = []

    self.class::MOVES.each do |(dx,dy)|
      x,y = pos
      if board.out_of_bounds?([x + dx, y + dy])
        possibles << [x + dx, y + dy]
      end
    end
    possibles
  end

end

class Pawn < Piece
  MOVES = [[1,0] ,[2,0],[1,-1],[1,1]]

  def possible_moves
    col_direction = color == :white ? 1 : -1
    possibles = []

    MOVES.each do |(dx,dy)|
      x,y = pos
      new_move = [x + (col_direction * dx), y + dy]

      if board.out_of_bounds?(new_move)
        possibles << new_move
      end
    end
    possibles
  end

end

class Bishop < SlidingPiece
  MOVES = [[1,1],[-1,-1],[1,-1],[-1,1]]
  def possible_moves
    diag_possible_moves
  end
end

class Rook < SlidingPiece
  MOVES = [[-1,0],[1,0],[0,1],[0,-1]]
  def possible_moves
    straight_possible_moves
  end
end

class Queen < SlidingPiece
  MOVES = [[-1,-1], [-1,0], [-1,1], [0,1],
           [1,1], [1,0], [1,-1], [0,-1]]
  def possible_moves
    diag_possible_moves + straight_possible_moves
  end
end

class Knight < SteppingPiece
  MOVES = [[-2,1], [-1,2], [1,2], [2,1],
           [2,-1], [1,-2], [-1,-2], [-2,-1]]
end

class King < SteppingPiece
  MOVES = [[-1,-1], [-1,0], [-1,1], [0,1],
           [1,1], [1,0], [1,-1], [0,-1]]
end
