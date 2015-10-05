class Piece

end

class NullPiece
  def present?
    false
  end

  def to_s
    "   "
  end
end

class SlidingPiece < Piece
end

class SteppingPiece < Piece

  def possible_moves(pos)
    new_pos = []

    self.class::MOVES.each do |(dx,dy)|
      x,y = pos
      if [x + dx, y + dy].all? {|el| el.between?(0,7)}
        new_pos << [x + dx, y + dy]
      end
    end
    new_pos
  end

end

class Pawn < Piece
end

class Bishop < SlidingPiece
end

class Rook < SlidingPiece
end

class Queen < SlidingPiece
end

class Knight < SteppingPiece
  MOVES = [[-2,1], [-1,2], [1,2], [2,1],
           [2,-1], [1,-2], [-1,-2], [-2,-1]]
end

class King < SteppingPiece
  MOVES = [[-1,-1], [-1,0], [-1,1], [0,1],
           [1,1], [1,0], [1,-1], [0,-1]]
end
