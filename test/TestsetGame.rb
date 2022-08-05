require 'minitest/autorun'
require '../lib/setGame.rb'  

class TestsetGame < MiniTest::Test

    def test_has_print_hand
        game = SetGame.new
        assert_respond_to game, :print_hand
    end
    

    def test_has_add_cards
        game = SetGame.new
        assert_respond_to game, :add_cards
    end

	def test_add_cards
        game = SetGame.new
        game.add_cards
        assert_equal 15, game.hand.size
    end

    def test_has_shuffle_hand
        game = SetGame.new
        assert_respond_to game, :shuffle_hand
    end

    def test_shuffle_hand
        game = SetGame.new
        game.shuffle_hand
        assert_equal 12, game.hand.size
    end

    def test_has_all_same
        game = SetGame.new
        assert_respond_to game, :all_same?
    end
  
    def test_all_same_true1
        game = SetGame.new
        assert_equal true, (game.all_same? "1", "1", "1")
    end

    def test_all_same_true2
        game = SetGame.new
        assert_equal true, (game.all_same? "Oval", "Oval", "Oval")
    end

    def test_all_same_false1
        game = SetGame.new
        assert_equal false, (game.all_same? "Red", "Green", "Green")
    end

    def test_all_same_false2
        game = SetGame.new
        assert_equal false, (game.all_same? "1", "2", "3")
    end


    def test_has_all_different
        game = SetGame.new
        assert_respond_to game, :all_different?
    end

    def test_all_different_true1
        game = SetGame.new
        assert_equal true, (game.all_different? "Red", "Green", "Purple")
    end

    def test_all_different_true2
        game = SetGame.new
        assert_equal true, (game.all_different? "1", "2", "3")
    end

    def test_all_different_false1
        game = SetGame.new
        assert_equal false, (game.all_different? "1", "2", "2")
    end

    def test_all_different_false2
        game = SetGame.new
        assert_equal false, (game.all_different? "Oval", "Oval", "Oval")
    end

    def test_has_same_or_different
        game = SetGame.new
        assert_respond_to game, :same_or_different?
    end

    def test_same_or_different_true1
        game = SetGame.new
        assert_equal true, (game.same_or_different? "2", "2", "2")
    end

    def test_same_or_different_true2
        game = SetGame.new
        assert_equal true, (game.same_or_different? "1", "2", "3")
    end

    def test_same_or_different_false1
        game = SetGame.new
        assert_equal false, (game.same_or_different? "1", "2", "2")
    end

    def test_same_or_different_false2
        game = SetGame.new
        assert_equal false, (game.same_or_different? "Red", "Green", "Green")
    end

    def test_has_is_set
        game = SetGame.new
        assert_respond_to game, :is_set?
    end

    def test_is_set_true
        card1 = Card.new "1", "Oval", "Open", "Red"
        card2 = Card.new "2", "Oval", "Open", "Red"
        card3 = Card.new "3", "Oval", "Open", "Red"
        game = SetGame.new
        assert_equal true, (game.is_set? card1, card2, card3)
    end

    def test_is_set_false
        card1 = Card.new "1", "Oval", "Open", "Red"
        card2 = Card.new "2", "Oval", "Open", "Red"
        card3 = Card.new "2", "Oval", "Open", "Red"
        game = SetGame.new
        assert_equal false, (game.is_set? card1, card2, card3)
    end


    def test_has_valid_choices
        game = SetGame.new
        assert_respond_to game, :valid_choices?
    end

    def test_valid_choices_true
        choice1 = 1
        choice2 = 2
        choice3 = 12
        game = SetGame.new
        assert_equal true, (game.valid_choices? choice1, choice2, choice3)
    end

    def test_valid_choices_false1
        choice1 = 0
        choice2 = 2
        choice3 = 12
        game = SetGame.new
        assert_equal false, (game.valid_choices? choice1, choice2, choice3)
    end

    def test_valid_choices_false2
        choice1 = 1
        choice2 = 2
        choice3 = 13
        game = SetGame.new
        assert_equal false, (game.valid_choices? choice1, choice2, choice3)
    end

    def test_has_deal
        game = SetGame.new
        assert_respond_to game, :deal?
    end

    def test_has_game_end
        game = SetGame.new
        assert_respond_to game, :game_end?
    end

    def test_has_pair_exists
        game = SetGame.new
        assert_respond_to game, :pair_exists?
    end

    def test_has_decrement_scores
        game = SetGame.new
        assert_respond_to game, :decrement_scores
    end

    def test_has_display_scores
        game = SetGame.new
        assert_respond_to game, :display_scores
    end
end