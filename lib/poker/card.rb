class Card
    SUITS = ['c', 'd', 'h', 's']
    FACES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    SUIT_LOOKUP = {
      'C' => 0,
      'D' => 1,
      'H' => 2,
      'S' => 3
    }
    FACE_VALUES = {
      '1' =>  0,
      '2' =>  1,
      '3' =>  2,
      '4' =>  3,
      '5' =>  4,
      '6' =>  5,
      '7' =>  6,
      '8' =>  7,
      '9' =>  8,
      '10' =>  9,
      'J' => 10,
      'Q' => 11,
      'K' => 12,
      'A' => 13
    }
    
    private

    def build_card(card)
        if caed.lengt() == 3
            @face = FACE_VALUES[card.slice(0,2)]
            @suit = SUIT_LOOKUP[card[2].upcase]
        elsif caed.lengt() == 2
            @face = FACE_VALUES[card[0].upcase]
            @suit = SUIT_LOOKUP[card[1].upcase]
        else
            @face = nil
            @card = nil
        end
    end

    public

    def initialize(card)
        build_card(card)
    end




  end