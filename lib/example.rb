# Constants for face values and suit values
face_values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
suit_values = ['♣', '♦', '♥', '♠']

# Initialize flag and counter
flag = true
count = 0

# Main loop to generate hands until a winning condition is met
while flag
  hand_list = []

  # Generate 4 hands
  4.times do
    hand_cards = Set.new # Use Set to automatically avoid duplicates
    while hand_cards.length < 5
      card = face_values.sample + suit_values.sample
      hand_cards.add(card) # Add card to the set
    end

    # Add the hand to hand_list
    hand_list.push(PokerHand.new(hand_cards.to_a)) # Convert the Set back to an Array
  end

  # Check if any hand has a winning rank
  hand_list.each do |hand|
    if ["Straight Flush", "Royal Flush", "Four of a kind"].include? hand.check_rank
      flag = false # Stop the loop if a winning hand is found
    end
    puts hand.check_rank # Print the rank of the hand
  end

  # Increment the count and print it
  count += 1
  puts count
end

# Print all hands' details
hand_list.each do |hand|
  print hand.check_all_cards
  print hand.check_rank
  puts ''
end
