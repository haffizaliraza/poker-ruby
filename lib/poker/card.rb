class Card
    
    attr_accessor :face, :suit

    SUITS = ['♣', '♦', '♥', '♠']
    FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    SUIT_LOOKUP = {
      '♣' => 1,
      '♦' => 2,
      '♥' => 3,
      '♠' => 4
    }
    FACE_VALUES = {
      '2' =>  2,
      '3' =>  3,
      '4' =>  4,
      '5' =>  5,
      '6' =>  6,
      '7' =>  7,
      '8' =>  8,
      '9' =>  9,
      '10' =>  10,
      'J' => 11,
      'Q' => 12,
      'K' => 13,
      'A' => 14
    }
    

    def build_card(card)
        if card.length() == 3
            @face = FACE_VALUES[card.slice(0,2)]
            @suit = SUIT_LOOKUP[card[2].upcase]
        elsif card.length() == 2
            @face = FACE_VALUES[card[0].upcase]
            @suit = SUIT_LOOKUP[card[1].upcase]
        else
            @face = nil
            @card = nil
        end
    end

    public

    def get_card_score()
        return FACE_VALUES[@face]
    end

    def initialize(card)
        build_card(card)
    end

    def get_suit_by_value(value)
        return SUIT_LOOKUP.key(value)
    end

    def get_face_by_value(value)
        return FACE_VALUES.key(value)
    end


  end




