require "minitest/autorun"
require_relative "human.rb"

class TestHuman < Minitest::Test
	def test_for_new_player
		player = Human.new("X")
		assert_equal("X", player.marker)
	end

	def test_get_move
		player = Human.new("X")
		move = player.get_move([" ", " ", " ", " ", " ", " ", " ", " ", " "])
		assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))	
	end
end