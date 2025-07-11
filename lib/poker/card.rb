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
    '2' =>  2, '3' =>  3, '4' =>  4, '5' =>  5,
    '6' =>  6, '7' =>  7, '8' =>  8, '9' =>  9,
    '10' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14
  }

  # Initialize a card from a string (like '2♣', 'K♦', etc.)
  def initialize(card)
    build_card(card)
  end

  def build_card(card)
    # If the card has 3 characters (e.g., '10♣'), it's face + suit
    if card.length == 3
      @face = FACE_VALUES[card[0..1]] # First two characters for the face
      @suit = SUIT_LOOKUP[card[2]]    # Last character for the suit
    # If the card has 2 characters (e.g., '2♣'), it's face + suit
    elsif card.length == 2
      @face = FACE_VALUES[card[0]]    # First character for the face
      @suit = SUIT_LOOKUP[card[1]]    # Last character for the suit
    else
      raise ArgumentError, "Invalid card format"
    end

    # Handle invalid face/suit values (if not found in the lookup)
    if @face.nil? || @suit.nil?
      raise ArgumentError, "Invalid face or suit in card"
    end
  end

  # Get the score of the card (based on its face value)
  def card_score
    FACE_VALUES.key(@face)
  end

  # Get the suit by its numeric value
  def get_suit_by_value(value)
    SUIT_LOOKUP.key(value)
  end

  # Get the face by its numeric value
  def get_face_by_value(value)
    FACE_VALUES.key(value)
  end
end
