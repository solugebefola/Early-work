class TowersGame

  attr_reader :board

  def initialize
    @board = Array.new(3) { [] }
    @board[0] = [3,2,1]
  end

end
