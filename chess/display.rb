require_relative "colorize"
require_relative "board"

class Display

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
  end

  def colors_for(i, j, b_w)
    if b_w == "black"
      piece_color = :black
    else
      piece_color = :white
    end

    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: piece_color }
  end

end
