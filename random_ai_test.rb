require "minitest/autorun"
require_relative "random_ai.rb"


class TestRandomAI < Minitest::Test
	
	def test_for_available_position_returned_using_random_ai_and_only_one_open_position
		player = RandomAI.new("X")
		assert_equal(4, player.get_move(["X", "O", "X", "O", " ", "X", "O", "X", "O"]))
	end

	def test_for_new_player
		player = RandomAI.new("X")
		assert_equal("X", player.marker)
	end
end