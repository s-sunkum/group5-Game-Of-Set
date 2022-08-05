require 'minitest/autorun'
require '../lib/player.rb'

class TestPlayer < MiniTest:: Test

    def test_initialize
        player = Player.new "Thomas"
        assert_equal "Thomas", player.name
        assert_equal 0, player.score

    end

    def test_add_score
        player1 = Player.new "Thomas"
        player1.add_score
        assert_equal 3, player1.score
    end

    def test_subtract_score
        player2 = Player.new "Thomas"
        player2.subtract_score
        assert_equal -1, player2.score
    end

    def test_update_score_true
        isSet = true
        player3 = Player.new "Thomas"
        player3.update_score(isSet)
        assert_equal 3, player3.score
    end

    def test_update_score_false
        isSet = false
        player4 = Player.new "Thomas"
        player4.update_score(isSet)
        assert_equal -1, player4.score
    end
end