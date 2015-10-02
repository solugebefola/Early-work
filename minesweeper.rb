class Minesweeper

  def initialize
    @board
    @flagged_tiles
  end


end

class Board

  attr_reader :grid, :length, :num_bombs

  ADJACENT_SPOTS = [
    [1,-1],
    [1,0],
    [1,1],
    [0,-1],
    [0,1],
    [-1,-1],
    [-1,0],
    [-1,1]
  ]
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

  def [](pos)
    row, col = pos
    grid[row][col]
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
    num_bombs = 0
    ADJACENT_SPOTS.each do |(dx, dy)|
      x = dx+pos[0]
      y = dy+pos[1]
      next if [x,y].any? { |val| !val.between?(0,length-1) }
      num_bombs += 1 if bomb_next_to?([x,y])
    end
    num_bombs
  end

  def bomb_next_to?(other_pos)
    self[other_pos].bomb
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
