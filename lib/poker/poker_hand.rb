class PokerHand
  attr_reader :cards

  ACTIONS = [
    ['Royal Flush',     :royal_flush? ],
    ['Straight Flush',  :straight_flush? ],
    ['Four of a kind',  :four_of_a_kind? ],
    ['Full house',      :full_house? ],
    ['Flush',           :flush? ],
    ['Straight',        :straight? ],
    ['Three of a kind', :three_of_a_kind? ],
    ['Two pair',        :two_pair? ],
    ['Pair',            :pair? ],
    ['Highest Card',    :highest_card? ]
  ]

  def initialize(cards)
    build_cards(cards)
  end

  def build_cards(cards)
    if cards.is_a?(Array) && cards.length == 5
      @cards = cards.map { |c| Card.new(c.to_s) }
    else
      @cards = []
    end
  end

  def royal_flush?
    straight_flush? && @cards.map(&:face).sort == [10, 11, 12, 13, 14]
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    count_faces(4)
  end

  def full_house?
    count_faces(3) && count_faces(2)
  end

  def flush?
    count_suits(5)
  end

  def straight?
    @cards.map(&:face).sort.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def three_of_a_kind?
    count_faces(3)
  end

  def two_pair?
    pairs = @cards.group_by(&:face).select { |_, group| group.length == 2 }.keys
    pairs.length == 2 ? pairs : false
  end

  def pair?
    count_faces(2)
  end

  def highest_card
    @cards.max_by(&:face).face rescue false
  end

  def check_rank
    ACTIONS.find { |name, method| send(method) }&.first
  end

  def check_all_cards
    @cards.map { |card| card.get_suit_by_value(card.suit) + card.get_face_by_value(card.face) }
  end

  private

  def count_faces(count)
    @cards.group_by(&:face).any? { |_, group| group.length == count }
  end

  def count_suits(count)
    @cards.group_by(&:suit).any? { |_, group| group.length == count }
  end
end
