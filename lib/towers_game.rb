class TowersGame

  attr_accessor :board

  def initialize
    @board = Array.new(3) { [] }
    @board[0] = [3,2,1]
  end

  def move(start_peg, end_peg)
    return nil unless valid_move?(start_peg, end_peg)
    disc = board[start_peg].pop
    board[end_peg] << disc
    nil
  end

  def valid_move?(start_peg, end_peg)
    return false if board[start_peg].empty?
    return false if !board[end_peg].empty? &&
                     board[end_peg].last < board[start_peg].last
    true
  end

  def won?
    board == [[],[3,2,1],[]] || board == [[],[],[3,2,1]]
  end

  def display
    puts "#{board}"
  end

  def take_turn
    puts "Please input a starting peg and ending peg: 'S,E'"
    input = gets.chomp
    input_array = input.split(',').map {|el| el.to_i }
    start_peg, end_peg = input_array
    move(start_peg, end_peg)
  end

  def start
    until won?
      take_turn
    end
    puts "YOU WON!"
  end


end
