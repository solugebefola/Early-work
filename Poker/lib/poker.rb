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

  def what_hand

    values = []
    cards_in_hand.each do |card|
      values << card.value
    end
    values.sort!

    if cards_in_hand.all? { |card| card.suit == cards_in_hand.first.suit }
      straight = true
      for i in 0...cards_in_hand.length - 1
        straight = false if values[i + 1] - values[i] != 1
      end
      return :straight_flush if straight
      return :flush
    end

    return :four_kind unless of_a_kind(4).empty?
    if !of_a_kind(3).empty?
      remaining_cards = (cards_in_hand - of_a_kind(3))
      if remaining_cards[0].value == remaining_cards[1].value
        return :full_house
      else
        return :three_kind
      end
    end

    straight = true
    for i in 0...cards_in_hand.length - 1
      straight = false if values[i + 1] - values[i] != 1
    end
    return :straight if straight

    if !of_a_kind(2).empty?
      remaining_cards = (cards_in_hand - of_a_kind(2))
      if remaining_cards.uniq == 2
        return :two_pair
      else
        return :pair
      end
    end






  end

  def of_a_kind(num)
    (1..13).to_a.each do |value|
      all_matched = cards_in_hand.select { |card| card.value == value }
      if all_matched.count == num
        return all_matched
      end
    end
    []
  end

end
