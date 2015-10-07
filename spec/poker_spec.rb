require 'poker'

describe Card do

  describe '#initialize' do
    it "creates a card with a suit and a value" do
      expect(Card.new(:hearts, 8).value).to eq (8)
    end
  end
end

describe Deck do
  let(:deck) { Deck.new }

  describe '#initialize' do

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

  describe '#remove' do
    it "takes a card and removes it from the deck" do
      eight_of_hearts = (deck.cards.select {|card| card.value == 8 && card.suit == :hearts }).first
      deck.remove(eight_of_hearts)
      expect(deck.cards.include?(eight_of_hearts)).to be_falsey
    end
  end
end

describe Hand do
  let(:deck) { Deck.new }
  let(:hand) { Hand.new(deck) }

  describe '#initialize' do
    it "has a reference to the deck" do
      expect(hand.deck.cards).to be_a(Array)
    end
    it "begins with an empty hand" do
      expect(hand.cards_in_hand).to eq([])
    end
  end

  describe '#get_cards'do
    it "takes a card from the deck" do
      expect(hand.get_cards(1).size).to eq(1)
    end
    it "takes multiple cards from the deck" do
      expect(hand.get_cards(3).size).to eq(3)
    end
  end
end
