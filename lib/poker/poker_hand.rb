class PokerHand

    attr_reader :cards

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

    

    def build_cards(cards)
        if (cards.is_a? Array) and cards.length() == 5
            @cards = cards.map do  |c| 
                Card.new(c.to_s)
            end
        else
            @cards = []
        end
    end

    def royal_flush?
        return false
    end

    def straight_flush?
        return false
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
        begin
            high_card = @cards.max_by { |c|  c.face }
            return [high_card, high_card.face ]
        rescue => exception
            return false
        end
    end

    

    def initialize(cards)
        build_cards(cards)
    end

    def check_rank()
        ACTIONS.map{ |ac| 
            (method(ac[1]).call)? ac[0] : false
        }.find { |v| v }
    end

end


hand1 = PokerHand.new(['2D', 'AD', 'AH', '10S', '5C'])
hand1.check_rank()