#Ursula and Solar's version
require "colorize"
require_relative "board"
require_relative "cursorable"

class Display
  attr_reader :board
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @piece_selected = false
  end

  def colorize_grid
    @board.grid.map.with_index do |row, i|
      row.map.with_index do |piece, j|
        piece.to_s.colorize(colors_for(i, j))
      end
    end
  end

  def colors_for(i, j, b_w = nil)
    if b_w == :black
      piece_color = :black
    else
      piece_color = :white
    end
    if [i, j] == @cursor_pos
      bg = :red
    elsif (i + j).odd?
      bg = :blue
    else
      bg = :light_blue
    end
    { background: bg, color: piece_color }
  end

  def render
    system('clear')
    puts "   0  1  2  3  4  5  6  7 "
    colorize_grid.each.with_index { |row, idx| puts "#{idx} #{row.join}" }
    nil
  end

  def positioning
    key = self.get_input
    if key == @cursor_pos
      board.select_piece(@cursor_pos)
    end
  end

end
