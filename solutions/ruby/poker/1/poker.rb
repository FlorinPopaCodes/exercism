# Represents a playing card.
class Card
  attr_reader :rank, :suit, :value, :adjusted_value

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
    self.value = self.class.values.index(rank)
    self.adjusted_value = (1.to_f / self.class.values.size) * value
  end

  def self.parse(card)
    rank = card[0..-2]
    suit = card[-1]

    new(rank, suit)
  end

  def self.values
    %w[2 3 4 5 6 7 8 9 10 J Q K A]
  end

  def self.suits
    %w[S H C D]
  end

  def <=>(other)
    value <=> other.value
  end

  private

  attr_writer :rank, :suit, :value, :adjusted_value
end

# Compares hands of 5 cards and returns the best hand.
class Poker
  attr_reader :hands

  def initialize(hands)
    self.hands = hands
  end

  def best_hand
    parsed_hands = hands.group_by { |hand| Hand.new(hand).value }

    parsed_hands[parsed_hands.keys.max]
  end

  private

  attr_writer :hands
end

# Representa a hand of 5 cards.
class Hand
  attr_reader :cards, :value

  def initialize(cards)
    self.cards = cards.map { |card| Card.parse(card) }.sort_by(&:value)

    calculate_value
  end

  private

  attr_writer :cards, :value

  def calculate_value
    if royal_flush?
      self.value = 9
    elsif straight_flush?
      adjustment = cards.map(&:value) == [0, 1, 2, 3, 12] ? cards[3].adjusted_value : cards.max_by(&:value).adjusted_value
      self.value = 8 + adjustment
    elsif four_of_a_kind?
      adjustment = groups.max_by { |_, group| group.size }[1].first.adjusted_value
      self.value = 7 + adjustment
    elsif full_house?
      adjustment = groups.max_by { |_, group| group.size }[1].first.adjusted_value
      self.value = 6 + adjustment
    elsif flush?
      adjustment = high_card.adjusted_value
      self.value = 5 + adjustment
    elsif straight?
      adjustment = cards.map(&:value) == [0, 1, 2, 3, 12] ? cards[3].adjusted_value : cards.max_by(&:value).adjusted_value
      self.value = 4 + adjustment
    elsif three_of_a_kind?
      self.value = 3 + groups.select { |_, group| group.size == 3 }.map { |_, group| group.first.adjusted_value }.first
    elsif two_pair?
      adjustment = groups.select { |_, group| group.size == 2 }.map { |_, group| group.first.adjusted_value }.max
      self.value = 2 + adjustment
    elsif pair?
      self.value = 1 + groups.select { |_, group| group.size == 2 }.map { |_, group| group.first.adjusted_value }.first
    else
      # When we have two high cards with the same value, we need to check for the biggest lowest one.
      self.value = high_card.adjusted_value + cards.min_by(&:value).adjusted_value
    end
  end

  def high_card
    cards.max_by(&:value)
  end

  def royal_flush?
    straight_flush? && high_card.value == 14
  end

  def straight_flush?
    straight? && flush?
  end

  def flush?
    cards.map(&:suit).uniq.size == 1
  end

  def four_of_a_kind?
    groups.any? { |_, group| group.size == 4 }
  end

  def full_house?
    pair? && three_of_a_kind?
  end

  def straight?
    groups.size == 5 && (
      cards.min_by(&:value).value == cards.max_by(&:value).value - 4 ||
      cards.map(&:value) == [0, 1, 2, 3, 12]
    )
  end

  def three_of_a_kind?
    groups.any? { |_, group| group.size == 3 }
  end

  def two_pair?
    groups.count { |_, group| group.size == 2 } == 2
  end

  def pair?
    groups.any? { |_, group| group.size == 2 }
  end

  def groups
    @groups ||= cards.group_by(&:value)
  end

  def suit_groups
    @suit_groups ||= cards.group_by(&:suit)
  end
end
