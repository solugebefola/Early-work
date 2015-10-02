class Minesweeper

  def initialize
    @board
    @flagged_tiles
  end


end

class Board

  attr_reader :grid, :length, :num_bombs

  def initialize(num_bombs, length = 9)
    @num_bombs = num_bombs
    @length = length
    @grid = Array.new(length){Array.new(length)}
  end

  def populate_board
    raise "Too many bombs." if num_bombs > length ** 2
    # (0...length).each do |row|
    #   (0...length).each do |col|
    #     grid[row][column] = Tile.new
    #   end
    # end

    grid.each do |row|
      row.map! { |square| Tile.new }
    end

    place_bombs
  end

  def place_bombs
    bombs_left = num_bombs
    until bombs_left == 0
      row, col = rand(length), rand(length)
      unless grid[row][col].bomb
        grid[row][col].add_bomb
        bombs_left -= 1
      end
    end
  end

  def num_adjacent_bombs(pos)
  end

  def bomb_next_to?(origin, other_pos)
  end


end

class Tile

  attr_reader :revealed, :bomb

  def initialize(bomb = false)
    @bomb = bomb
    @revealed = false
  end

  def reveal_tile
    revealed = true
  end

  def add_bomb
    @bomb = true
  end

end
