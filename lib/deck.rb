=begin
Deck class contains 81 unique cards. An array is used to store these cards.
Deck class can keep track of the number of cards remaining and draw one card
at a time as needed.
=end

require_relative 'card'

class Deck

=begin
    Initializes a deck with 81 unique cards and shiffles them
=end
    def initialize
        #Intialize a deck array
        @deck = []

        #Attributes for the cards
        @numbers = ["1", "2", "3"]
        @shapes = ["Diamond", "Squiggle", "Oval"]
        @shading = ["Solid", "Striped", "Open"]
        @colors = ["Red", "Green", "Purple"]

        #Nested blocks to add 81 cards to deck
        @numbers.each{ |num| @shapes.each{ |shape| @shading.each{ |shade| @colors.each{ |color| @deck.push Card.new num, shape, shade, color}}}}

        #Shuffle the deck
        @deck.shuffle!
    end
    
=begin
    Reports the size of the deck

    @return
        The size of the deck array
=end
    def size
        @deck.size
    end

=begin
    Draws a card from the deck and returns it

    @return
        The drawn card from the deck
=end
    def draw_card  
        @deck.shift
    end

=begin
    Adds a card to the deck

    @param card
        The card to be added to the deck
=end
    def add(card)
        @deck.push card
    end

=begin
    Shuffles the deck
=end
    def shuffle!
        @deck.shuffle!
    end
end