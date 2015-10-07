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

  def initialize(deck)
    @deck = deck
  end

end
