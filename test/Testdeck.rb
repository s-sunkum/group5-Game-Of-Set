require 'minitest/autorun'
require '../lib/deck.rb'

class TestDeck < MiniTest::Test

    @@numbers = ["1", "2", "3"]
    @@shapes = ["Diamond", "Squiggle", "Oval"]
    @@shading = ["Solid", "Striped", "Open"]
    @@colors = ["Red", "Green", "Purple"]

    def setup
        @deck = []

        @@numbers.each{ |num| @@shapes.each{ |shape| @@shading.each{ |shade| @@colors.each{ |color| @deck.push Card.new num, shape, shade, color}}}}

        @deck.shuffle!
    end

    def test_initialize
        deck1 = Deck.new
        assert_equal deck1.size, @deck.size
    end

    def test_draw_card
        deck2 = Deck.new
        deck2.draw_card
        assert_equal 80, deck2.size
    end

    def test_size
        deck3 = Deck.new
        assert_equal 81, deck3.size
    end

    def test_add
        card = Card.new "1", "Oval", "Open", "Red"
        deck4 = Deck.new 
        deck4.add(card)
        @deck.push card
        assert_equal deck4.size, @deck.size
    end
end