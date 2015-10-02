class Minesweeper
  attr_reader :board

  def initialize(board = Board.new(3,6))
    @board = board
  end

  def revealed

  end

  def revealed_zero_tile(pos)
    Board::ADJACENT_SPOTS.each do |(dx, dy)|
      x = dx+pos[0]
      y = dy+pos[1]
      next if [x,y].any? { |val| !val.between?(0,board.length-1) }
      candidate_tile = board[[x,y]]
      unless candidate_tile.revealed
        candidate_tile.reveal_tile
        revealed_zero_tile([x,y]) if candidate_tile.num_bombs_nearby == 0
      end

    end
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

  def display
    grid.each_index do |row|
      puts "#{row}: #{grid[row].join(" ")}"
    end
    nil
  end

  def populate_board

    raise "Too many bombs." if num_bombs > length ** 2

    grid.each do |row|
      row.map! { |square| Tile.new }
    end

    place_bombs
    place_numbers
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

  def place_numbers
    (0...length).each do |row|
      (0...length).each do |col|
        set_tile_bomb_count([row,col])
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

  def set_tile_bomb_count(pos)
    self[pos].num_bombs_nearby = num_adjacent_bombs(pos)
  end

  def bomb_next_to?(other_pos)
    self[other_pos].bomb
  end


end

class Tile

  attr_accessor :num_bombs_nearby, :flagged, :revealed, :bomb

  def initialize(bomb = false)
    @bomb = bomb
    @revealed = false
    @num_bombs_nearby = 0
    @flagged = false
  end

  def reveal_tile
    self.revealed = true
  end

  def to_s
    return "*" unless revealed
    return "F" if flagged
    return "B" if bomb
    num_bombs_nearby.to_s
  end

  def add_bomb
    self.bomb = true
  end

  def toggle_flag
    self.flagged = flagged ? false : true
  end

end
