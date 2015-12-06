require 'towers_game'

describe TowersGame do
let(:game) { TowersGame.new }
  describe '#initialize' do

    it "creates an array of arrays of length 3" do
      expect(game.board.length).to eq(3)
      expect(game.board[0]).to be_a(Array)
    end
    it "places the discs in the first row" do
      expect(game.board[0]).to eq([3,2,1])
    end
  end

  describe '#valid_move?' do
    it "returns false when attempting to move a larger disc onto a smaller disc" do
      game.move(0,1)
      expect(game.valid_move?(0,1)).to be_falsey
    end
    it "returns true when moving a smaller disc onto a larger disc or empty peg" do
      expect(game.valid_move?(0,1)).to be_truthy
    end
    it "returns false when attempting to move from an empty peg" do
      expect(game.valid_move?(1,0)).to be_falsey
    end
  end

  describe '#move' do
    it "performs a valid move" do
      game.move(0,1)
      expect(game.board).to eq([[3,2],[1],[]])
    end
    it "does not perform an invalid move" do
      game.move(1,0)
      expect(game.board).to eq([[3,2,1],[],[]])
    end
  end

  describe '#won?' do
    it "returns true when the game is won" do
      game.board = [[],[3,2,1],[]]
      expect(game.won?).to be_truthy
    end

    it "returns false when the game is not won" do
      game.board = [[],[3,2],[1]]
      expect(game.won?).to be_falsey
    end
  end

  describe '#display' do
    it "puts out an image of the board" do
      expect {game.display}.to output("[[3, 2, 1], [], []]\n").to_stdout
    end
  end

  describe '#take_turn' do
    it "performs a move based on user input" do
      allow(game).to receive(:gets).and_return("0,1\n")
      game.take_turn
      expect(game.board).to eq([[3,2],[1],[]])
    end
  end

  describe '#start' do
    it "returns when the game is won" do
      game.board = [[1],[3,2],[]]
      allow(game).to receive(:gets).and_return("0,1\n")
      game.take_turn
      expect {game.start}.to output("YOU WON!\n").to_stdout
    end
  end

end
