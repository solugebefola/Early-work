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
    possibles = []

    self.class::MOVES.each do |(dx,dy)|
      x,y = pos
      if [x + dx, y + dy].all? {|el| el.between?(0,7)}
        possibles << [x + dx, y + dy]
      end
    end
    possibles
  end

end

class Pawn < Piece
end

class Bishop < SlidingPiece
  def possible_moves(pos)
    possibles = []
    i = 1
    until i > 7
      [-1,1].each do |j|
        [-1,1].each do |k|
          x, y = pos
          candidate = [x + (i * j) , y + (i * k)]
          possibles << candidate
        end
      end
    end
    possibles.select{|coor| coor.all?{|el| el.between?(0,7)}}
  end
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
