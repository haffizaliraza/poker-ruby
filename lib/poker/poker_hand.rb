class PokerHand

    ACTIONS = [
        ['Royal Flush',     :royal_flush? ],
        ['Straight Flush',  :straight_flush? ],
        ['Four of a kind',  :four_of_a_kind? ],
        ['Full house',      :full_house? ],
        ['Flush',           :flush? ],
        ['Straight',        :straight? ],
        ['Three of a kind', :three_of_a_kind?],
        ['Two pair',        :two_pair? ],
        ['Pair',            :pair? ],
        ['Highest Card',    :highest_card? ]
      ]

    private

    def build_card(cards)
        if cards.is_a? Array cards.length() == 5
            @cards = cards.map do  |c| 
                Card.new(card.to_s)
            end
        else
            @cards = []
        end
    end

    def royal_flush?
    end

    def straight_flush?
    end

    def four_of_a_kind?
    end

    def full_house?
    end

    def flush?
    end

    def straight?
    end

    def three_of_a_kind?
    end

    def two_pair?
    end

    def pair?
    end

    def highest_card?
    end

    public

    def initialize(cards)
        build_cards(card)
    end

    def check_rank(cards)

    end



end