require 'colorize'

class Tile
  attr_accessor :num_bombs_nearby, :flagged, :revealed, :bomb

  def initialize(bomb = false)
    @bomb = bomb
    @revealed = false
    @num_bombs_nearby = 0
    @flagged = false
  end

  def reveal_tile
    self.revealed = true unless flagged
  end

  def to_s
    case
    when flagged then "\u2691".encode('utf-8').colorize(:blue)
    when !revealed then "*".colorize(:blue)
    when bomb then "\u2620".encode('utf-8').colorize(:red)
    when num_bombs_nearby == 0 then "_".colorize(:cyan)
    else num_bombs_nearby.to_s.colorize(:magenta)
    end
  end

  def add_bomb
    self.bomb = true
  end

  def toggle_flag
    self.flagged = flagged ? false : true
  end

end
