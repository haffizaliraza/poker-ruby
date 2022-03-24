face_values = ['2' ,'3' ,'4' ,'5' ,'6' ,'7' ,'8' ,'9' ,'10' ,'J' ,'Q' ,'K' ,'A' ]
suit_values =  ['♣', '♦', '♥', '♠']

flag = true
count = 0

while flag do
    hand_list = []
    for hand in 1..4 do
        list = []
        for a in 1..5 do
            while list.length() != 5 do
                card = face_values.sample + suit_values.sample
                for h_l in hand_list do 
                    if !list.include?(card.to_s)
                        list.append(face_values.sample + suit_values.sample)
                    end
            end
        end
        hand_list.append(PokerHand.new(list))
    end

#    for hand in hand_list do
#        if ["Straight Flush", "Royal Flush", "Four of a kind"].include? hand.check_rank()
#            flag = false
#        end
#        puts hand.check_rank() 
#    end

    count += 1
    puts count
end


for hand in hand_list do 
    print hand.check_all_cards()
    print hand.check_rank() 
    puts ''
    
end
