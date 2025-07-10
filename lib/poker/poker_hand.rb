class PokerHand
  attr_reader :cards

  ACTIONS = [
    ['Royal Flush',     :royal_flush?],
    ['Straight Flush',  :straight_flush?],
    ['Four of a kind',  :four_of_a_kind?],
    ['Full house',      :full_house?],
    ['Flush',           :flush?],
    ['Straight',        :straight?],
    ['Three of a kind', :three_of_a_kind?],
    ['Two pair',        :two_pair?],
    ['Pair',            :pair?],
    ['Highest Card',    :highest_card?]
  ].freeze

  def initialize(cards)
    build_cards(cards)
  end

  def build_cards(cards)
    if cards.is_a?(Array) && cards.length == 5
      @cards = cards.map { |c| Card.new(c.to_s) }
      @faces = @cards.map(&:face).sort
      @suits = @cards.map(&:suit)
      @face_groups = @faces.tally
      @suit_groups = @suits.tally
    else
      @cards = []
      @faces = []
      @suits = []
      @face_groups = {}
      @suit_groups = {}
    end
  end

  def royal_flush?
    straight_flush? && @faces == [10, 11, 12, 13, 14]
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    @face_groups.value?(4)
  end

  def full_house?
    @face_groups.value?(3) && @face_groups.value?(2)
  end

  def flush?
    @suit_groups.value?(5)
  end

  def straight?
    return false unless @faces.uniq.length == 5
    @faces.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def three_of_a_kind?
    @face_groups.value?(3)
  end

  def two_pair?
    @face_groups.select { |_, count| count == 2 }.length == 2
  end

  def pair?
    @face_groups.value?(2)
  end

  def highest_card?
    true # Always true if no other hand matches
  end

  def highest_card
    @faces.max
  end

  def check_rank
    ACTIONS.find { |_, method| send(method) }&.first
  end

  def check_all_cards
    @cards.map do |card|
      "#{card.get_suit_by_value(card.suit)}#{card.get_face_by_value(card.face)}"
    end
  end
end
