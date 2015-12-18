#Ursula and Solar's version
require "colorize"
require_relative "board"
require_relative "cursorable"

class Display
  attr_reader :board
  attr_accessor :selected_piece, :cursor_pos

  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @selected_pos = nil
    @selected_piece = nil
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

  def show_movement
    key = nil
    until key == :escape
      render
      p @selected_piece
      p @cursor_pos
      p "chb#{board.checkmate?(:black)} chw#{board.checkmate?(:white)}"
      p "king check? #{board.in_check?(:white)}"
      key = position_cursor
    end
  end

  def render
    system('clear')
    puts "   0  1  2  3  4  5  6  7 "
    colorize_grid.each.with_index { |row, idx| puts "#{idx} #{row.join}" }
    nil
  end

  def position_cursor
    key = self.get_input

    if key == @cursor_pos && selected_piece.nil?
      @selected_piece = board.select_piece(@cursor_pos)
    elsif key == @cursor_pos
      @selected_piece.move(@cursor_pos)
      @selected_piece = nil
    end
    key
  end

end
