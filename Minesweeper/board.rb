require_relative 'tile'

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
    @grid = Array.new(length) { Array.new(length) }
  end

  def display
    print "   #{(0...length).to_a.join(" ")}\n"
    grid.each_index do |row|
      puts "#{row}: #{grid[row].join(" ")}"
    end

    nil
  end

  def populate_board
    raise "Too many bombs." if num_bombs > length ** 2

    create_tiles
    place_bombs
    place_numbers
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def create_tiles
    grid.each do |row|
      row.map! { |square| Tile.new }
    end
  end

  def place_bombs
    grid.flatten.sample(num_bombs).each { |tile| tile.add_bomb }
  end

  def place_numbers
    (0...length).each do |row|
      (0...length).each { |col| set_tile_bomb_count([row,col]) }
    end
  end

  def num_adjacent_bombs(pos)
    num_bombs = 0
    ADJACENT_SPOTS.each do |(dx, dy)|
      new_pos = [dx + pos[0], dy + pos[1]]
      next if new_pos.any? { |val| !val.between?(0, length - 1) }
      num_bombs += 1 if bomb_next_to?(new_pos)
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
