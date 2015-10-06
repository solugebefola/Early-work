require 'byebug'
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
  attr_reader :color

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
      multiplier = 0
      until multiplier > 7
        multiplier += 1
        x, y = pos
        candidate = [x + (dx * multiplier), y + (dy * multiplier)]
        next unless board.out_of_bounds?(candidate)

        case board[candidate].color
        when nil
          possibles << candidate
        when self.color
          multiplier = 8
        else
          possibles << candidate
          multiplier = 8
        end

      end
    end
    possibles
  end

end


class SteppingPiece < Piece

  def possible_moves
    possibles = []

    self.class::MOVES.each do |(dx,dy)|
      x,y = pos
      candidate = [x + dx, y + dy]

      next unless board.out_of_bounds?(candidate)
      # p candidate
      case board[candidate].color
      when nil
        possibles << candidate
      when self.color
        next
      else
        possibles << candidate
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
    color_opposite = {:black => :white , :white => :black}

    MOVES.each do |(dx,dy)|
      x,y = pos
      candidate = [x + (col_direction * dx), y + dy]
      next unless board.out_of_bounds?(candidate)

      if dy == 0 && dx == 1
        possibles << candidate if board[candidate].is_a?(NullPiece)
      end

      if dy == 0 && dx == 2
        if starting_position?(x)
          if board[[x + 1, y]].is_a?(NullPiece) && board[candidate].is_a?(NullPiece)
            possibles << candidate
          end
        end
      end

      if dy != 0 # capture on diagonal
        if board[candidate].color == color_opposite[self.color]
          possibles << candidate
        end
      end


    end
    possibles
  end

  def starting_position?(row)
    (color == :white && row == 1) || (color == :black && row == 6)
  end

  def to_s
    pawn = color == :white ? "\u2659" : "\u265F"
    " #{pawn.encode("utf-8")} "
  end

end

class Bishop < SlidingPiece
  MOVES = [[1,1],[-1,-1],[1,-1],[-1,1]]

  def to_s
    bishop = color == :white ? "\u2657" : "\u265D"
    " #{bishop.encode("utf-8")} "
  end
end

class Rook < SlidingPiece
  MOVES = [[-1,0],[1,0],[0,1],[0,-1]]

  def to_s
    rook = color == :white ? "\u2656" : "\u265C"
    " #{rook.encode("utf-8")} "
  end
end

class Queen < SlidingPiece
  MOVES = [[-1,-1], [-1,0], [-1,1], [0,1],
           [1,1], [1,0], [1,-1], [0,-1]]

  def to_s
    queen = color == :white ? "\u2655" : "\u265B"
    " #{queen.encode("utf-8")} "
  end
end

class Knight < SteppingPiece
  MOVES = [[-2,1], [-1,2], [1,2], [2,1],
           [2,-1], [1,-2], [-1,-2], [-2,-1]]

   def to_s
     knight = color == :white ? "\u2658" : "\u265E"
     " #{knight.encode("utf-8")} "
   end
end

class King < SteppingPiece
  MOVES = [[-1,-1], [-1,0], [-1,1], [0,1],
           [1,1], [1,0], [1,-1], [0,-1]]
   def to_s
     king = color == :white ? "\u2654" : "\u265A"
     " #{king.encode("utf-8")} "
   end
end
