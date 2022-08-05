require_relative 'deck'
require_relative 'card'

=begin
setGame class keeps track of the game state
and provides functions that can be used to 
alter the game state inorder to implement
the actual set card game
=end
class SetGame
    attr_accessor :hand
=begin
    Intializes a new deck object and a hand which represents 
    the cards being displayed to the players
=end
    def initialize
        @deckSet = Deck.new
        @hand = []
        @hand.unshift @deckSet.draw_card while @hand.size < 12
    end


=begin
    Prints the cards in hand array
=end
    def print_hand
        i = 1
        puts "\n"
        for card in @hand
            puts "Card #" + i.to_s + ": " + card.to_s
            i += 1
        end
        puts "\n"
    end

=begin
    Shuffles cards in the hand array
=end
    def shuffle_hand
        #Add cards from hand to overall game deck
        @deckSet.add @hand.shift while @hand.size > 0

        #Shuffle the game deck
        @deckSet.shuffle!

        #Add cards back to hand
        @hand.unshift @deckSet.draw_card while @hand.size < 12
    end

=begin
    Adds 3 cards from game deck to hand
=end
    def add_cards
        3.times do
            @hand.unshift @deckSet.draw_card
        end 
    end

=begin
    Reports if the given three attributes are all same

    @param attr1
        first attribute
    @param attr2
        second attribute
    @param attr3
        third attribute
    @return
        attr1 == attr2 == atrr3
=end
    def all_same?(attr1, attr2, attr3)
        attr1 == attr2 && attr2 == attr3 && attr1 == attr3 #Implicit return
    end

=begin
    Reports if the given three attributes are all different

    @param attr1
        first attribute
    @param attr2
        second attribute
    @param attr3
        third attribute
    @return
        attr1 != attr2 != atrr3
=end
    def all_different?(attr1, attr2, attr3)
        attr1 != attr2 && attr2 != attr3 && attr1 != attr3 #Implicit return
    end

=begin
    Reports if the given three attributes are all same or all different

    @param attr1
        first attribute
    @param attr2
        second attribute
    @param attr3
        third attribute
    @return
        attr1 == attr2 == atrr3 || attr1 != attr2 != attr3
=end
    def same_or_different?(attr1, attr2, attr3)
        all_same?(attr1,attr2,attr3) || all_different?(attr1,attr2,attr3) 
    end

=begin
    Reports if the given three cards form a set

    @param card1
        first card
    @param card2
        second card
    @param card3
        third card
    @return
        if card1, card2, card3 form a set
=end
    def is_set?(card1,card2,card3)
        result = true
        result = false unless same_or_different? card1.number, card2.number, card3.number
        result = false unless same_or_different? card1.shape, card2.shape, card3.shape
        result = false unless same_or_different? card1.shading, card2.shading, card3.shading
        result = false unless same_or_different? card1.color, card2.color, card3.color
        result
    end

=begin
    Reports if the choices are valid indexes of the hand

    @param choice1
        first choice
    @param choice2
        second choice
    @param choice3
        third choice
    @return
        if choice1, choice2, choice3 are valid indexes of hand
=end
    def valid_choices? (choice1, choice2, choice3)
        choice1.between?(1,@hand.size) && choice2.between?(1,@hand.size) && choice3.between?(1,@hand.size)
    end

=begin
    Reports if the player chose a valid set and updates hand accordingly

    @param choice1
        first choice
    @param choice2
        second choice
    @param choice3
        third choice
    @return
        if choice1, choice2, choice3 form a set
=end
    def deal? (choice1,choice2,choice3)

        #Set result initially to false
        result = false

        #convert choices to cards
        card1 = @hand[choice1 - 1]
        card2 = @hand[choice2 - 1]
        card3 = @hand[choice3 - 1]
        if is_set? card1, card2, card3

            #if the cards are a set, delete them from hand
            @hand.delete card1
            @hand.delete card2
            @hand.delete card3

            #Adjust hand to include 12 cards
            @hand.unshift @deckSet.draw_card while @hand.size < 12

            #Set result
            result = true
        end
        
        result  #Implicit return
    end

    #gameEnd method returns true or false whether the deck has run out of sets
    def game_end?
        @deckSet.size == 0 && !pair_exists?
    end
    
=begin
    Reports if a set exists in hand

    @return
        if hand includes at least one set
=end
    def pair_exists?
        result = false
        for card1 in @hand
            for card2 in @hand
                for card3 in @hand
                    if card1 != card2 && card2 != card3 && card1 != card3
                        if is_set? card1, card2, card3
                            result = true
                        end
                    end
                        
                end
            end
        end
        result  #Implicit return
    end

=begin
    Decrements scores of all players in the given hash

    @param players
        the hash including the name symbol and player object
=end
    def decrement_scores(players)
        players.each do |key,value|
            value.subtract_score
        end
    end

=begin
    Displays the scores of each player in the given hash
    
    @param players
        the hash including the name symbol and player object  
=end
    def display_scores(players)
        players.each {|player,playerScore| puts player.to_s + ": " + playerScore.score.to_s}
    end

end
