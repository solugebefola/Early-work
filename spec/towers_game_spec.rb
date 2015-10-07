require 'towers_game'

describe TowersGame do

  describe '#initialize' do
    let(:game) { TowersGame.new }
    it "creates an array of arrays of length 3" do
      expect(game.board.length).to eq(3)
      expect(game.board[0]).to be_a(Array)
    end
    it "places the discs in the first row" do
      expect(game.board[0]).to eq([3,2,1])
    end
  end

end
