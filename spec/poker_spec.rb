require 'poker'

describe Card do

  describe '#initialize' do
    it "creates a card with a suit and a value" do
      expect(Card.new(:hearts, 8).value).to eq (8)
    end
  end
end

describe Deck do
  describe '#initialize' do
    let(:deck) { Deck.new }

    it "creates a 52 card deck" do
      expect(deck.cards.length).to eq(52)
    end
    it "has 13 cards of each suit" do
      hearts = deck.cards.select { |card| card.suit == :hearts }
      expect(hearts.length).to eq(13)
    end
    it "has four cards of each value" do
      queens = deck.cards.select { |card| card.value == 12 }
      expect(queens.length).to eq(4)
    end
  end
end

describe Hand do
  let(:deck) { Deck.new }

  describe '#initialize' do
    it "has a reference to the deck" do
      expect(Hand.new(deck).cards).to be_a(Array)
    end
  end

  # describe '#get_cards'do
  #
  # end
end
