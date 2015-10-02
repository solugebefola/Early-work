require 'yaml'
require_relative 'board'
require 'colorize'

class Minesweeper
  attr_accessor :board

  def initialize(board = Board.new(1,6))
    @board = board
  end

  def get_filename
    puts "Type in the path/filename: "
    STDIN.gets.chomp
  end

  def save_game
    name = get_filename
    f = File.new(name, 'w')
    f << board.to_yaml
    f.close
  end

  def load_game
    name = get_filename
    f = File.open(name, 'r')
    self.board = YAML::load(f.read)
    f.close
  end

  def play
    board.populate_board
    until won? || lost?
      display
      execute
    end
    display

    puts won? ? "YOU WIN!" : "YOU LOST!"
  end

  def display
    board.display
  end

  def tiles
    board.grid.flatten
  end

  def won?
    tiles.all? do |tile|
      (tile.bomb == true && tile.flagged == true) ||
      (tile.bomb == false && tile.revealed == true)
    end
  end

  def lost?
    tiles.any? do |tile|
      tile.bomb == true && tile.revealed == true
    end
  end

  def manipulate_tiles(command)
    pos = ask_for_position
    tile = board[pos]

    unless command == "F"
      tile.reveal_tile
      revealed_zero_tile(pos) if tile.num_bombs_nearby == 0
    else
      tile.toggle_flag
    end
  end

  def execute
    command = ask_for_command
    case command
    when "S" then save_game
    when "L" then load_game
    when "F", "R" then manipulate_tiles(command)
    when "E" then exit
    end
  end

  def ask_for_command
    puts "Enter command: F for flag, R for reveal, "\
    "S for save, L for Load Game, and E to exit."
    STDIN.gets.chomp.upcase
  end

  def ask_for_position
    p "Enter position (x,y): "
    position = STDIN.gets.chomp
    x, y = position.split(",")
    [Integer(x),Integer(y)]
  end

  def revealed_zero_tile(pos)
    Board::ADJACENT_SPOTS.each do |(dx, dy)|
      x, y = dx + pos[0], dy + pos[1]

      next if [x, y].any? { |val| !val.between?(0,board.length - 1) }
      candidate_tile = board[[x, y]]

      unless candidate_tile.revealed
        candidate_tile.reveal_tile unless candidate_tile.flagged
        revealed_zero_tile([x, y]) if candidate_tile.num_bombs_nearby == 0
      end
    end
  end

end
