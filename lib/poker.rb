class Card
 attr_reader :value, :suit

  def initialize(suit, value)
    @suit = suit
    @value = value
  end
end

class Deck

  attr_accessor :cards

  def initialize
    @cards = make_cards
  end

  def remove(card)
    cards.delete(card)
  end

private
  def make_cards
    cards = []

    (1..13).each do |value|
      [:hearts, :clubs, :diamonds, :spades].each do |suit|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

end

class Hand

  attr_reader :deck
  attr_accessor :cards_in_hand

  def initialize(deck)
    @deck = deck
    @cards_in_hand = []
  end

  def get_cards(num_cards)
    cards = []

    num_cards.times do
      drawn_card = deck.cards.sample
      cards << drawn_card
      deck.remove(drawn_card)
    end

    cards.each do |card|
      cards_in_hand << card
    end
    nil
  end

  def put_cards(*indices)
    discarded_cards = []

    indices.each do |index|
      discarded_cards << cards_in_hand[index]
      cards_in_hand.delete_at(index)
    end

    discarded_cards.each do |card|
      deck.cards << card
    end
    nil
  end

end
