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
        return (straight_flush?() and [10,11,12,13,14] == @cards.map{|c| c.face }.sort())
    end

    def straight_flush?
        return (flush?() and straight?())
    end

    def four_of_a_kind?
        hash = Hash.new(0)
        @cards.map{ |c| hash[c.face] += 1 }
        return hash.key(4) ? hash.key(4) : false
    end

    def full_house?
        hash = Hash.new(0)
        @cards.map{ |c| hash[c.face] += 1 }
        return (hash.key(2)) && hash.key(3) ? true : false
    end

    def flush?
        hash = Hash.new(0)
        @cards.map{ |c| hash[c.suit] += 1 }
        return hash.key(5) ? hash.key(5) : false
    end

    def straight?
        return @cards.map{|c| c.face  }.sort().each_cons(2).all? { |x,y| y == x + 1 }
    end

    def three_of_a_kind?
        hash = Hash.new(0)
        @cards.map{ |c| hash[c.face] += 1 }
        return hash.key(3) ? hash.key(3) : false
    end

    def two_pair?
        hash = Hash.new(0)
        @cards.map{ |c| hash[c.face] += 1 }
        return (hash.select{|k, v| v ==  2}.keys.length() == 2) ? hash.select{|k, v| v ==  2}.keys : false
    end

    def pair?
        hash = Hash.new(0)
        @cards.map{ |c| hash[c.face] += 1 }
        return hash.key(2) ? hash.key(2) : false
    end


    def highest_card?
        begin
            high_card = @cards.max_by { |c|  c.face }
            return high_card.face
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

    def check_all_cards()
        cards_list = []
        for card in @cards do
            cards_list.append( card.get_suit_by_value(card.suit) + card.get_face_by_value(card.face) )
        end
        return cards_list
    end

end

