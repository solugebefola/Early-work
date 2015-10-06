#Ursula and Solar's version
require "colorize"
require_relative "board"
require_relative "cursorable"

class Display
  include Cursorable
  
  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
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
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: piece_color }
  end

  def render
    while true
      colorize_grid.each { |row| puts row.join }

      Cursorable::get_input
    end
    nil
  end

end
