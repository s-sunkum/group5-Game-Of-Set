require 'minitest/autorun'
require '../lib/hintGen.rb'  #assume setGame.rb on load path

class TesthintGen < MiniTest::Test
    def test_has_num_pairs
        hint = HintGen.new []
        assert_respond_to hint, :num_pairs
    end

    def test_num_pairs0
        card1 = Card.new "1", "Oval", "Open", "Red"
        card2 = Card.new "2", "Oval", "Open", "Red"
        card3 = Card.new "2", "Oval", "Open", "Red"
        hint = HintGen.new [card1,card2,card3]
        assert_equal 0, hint.num_pairs
    end

    def test_num_pairs1
        card1 = Card.new "1", "Oval", "Open", "Red"
        card2 = Card.new "2", "Oval", "Open", "Red"
        card3 = Card.new "3", "Oval", "Open", "Red"
        hint = HintGen.new [card1,card2,card3]
        assert_equal 1, hint.num_pairs
    end

    def test_num_pairs2
        card1 = Card.new "1", "Oval", "Open", "Red"
        card2 = Card.new "2", "Oval", "Open", "Red"
        card3 = Card.new "3", "Oval", "Open", "Red"
        card4 = Card.new "3", "Oval", "Open", "Green"
        card5 = Card.new "3", "Oval", "Open", "Purple"
        hint = HintGen.new [card1,card2,card3,card4,card5]
        assert_equal 2, hint.num_pairs
    end


end