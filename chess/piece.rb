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
end

class King < SteppingPiece
end
