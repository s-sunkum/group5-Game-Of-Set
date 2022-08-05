require_relative 'setGame'
=begin
Represents a hint generator when called provides the players with hints
=end
class HintGen < SetGame

=begin
    Creates an instance variable for the current hand
    @param
        The current hand in the game
=end
    def initialize(hand)
        @hand = hand
    end

=begin
    Tells the player how many sets are available
    @return
        Number of pairs available
=end
    def num_pairs
        count = 0
        repetitionCount = 6
        for card1 in @hand
            for card2 in @hand
                for card3 in @hand
                    if card1 != card2 && card2 != card3 && card1 != card3
                        if is_set? card1, card2, card3
                            count += 1
                        end
                    end
                        
                end
            end
        end
        count/repetitionCount  #Implicit return
    end
end