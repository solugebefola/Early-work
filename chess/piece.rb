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
  def diag_possible_moves(pos)
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
      i += 1
    end
    possibles.select{|coor| coor.all?{|el| el.between?(0,7)}}
  end

  def straight_possible_moves(pos)
    possibles = []
    i = 1
    until i > 7
      x, y = pos
      [-1,1].each do |k|
        candidate_x = [x + (i * k) , y]
        candidate_y = [x , y + (i * k)]
        (possibles << candidate_x) << candidate_y
      end
      i += 1
    end
    possibles.select{|coor| coor.all?{|el| el.between?(0,7)}}
  end


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

end

class Rook < SlidingPiece

end

class Queen < SlidingPiece
  def move(pos)
    diag_possible_moves(pos) + straight_possible_moves(pos)
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
