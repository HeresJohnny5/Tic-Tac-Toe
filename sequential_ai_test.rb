require "minitest/autorun"
require_relative "sequential_ai.rb"

class TestSequentialAI < MiniTest::Test
	
	def test_first_available_space_returned_1
        player = SequentialAI.new("X")
        assert_equal(1, player.get_move([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	def test_first_available_space_returned_2
        player = SequentialAI.new("X")
        assert_equal(2, player.get_move(["X", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	def create_player_returns_players_marker
		player = SequentialAI.new("O")
		assert_equal("O", player.marker)
	end
end