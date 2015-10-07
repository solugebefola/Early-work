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

end
