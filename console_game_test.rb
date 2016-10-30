require "minitest/autorun"
require_relative "console_game.rb"

class TestForPlayers < Minitest::Test
	def test_for_sequential_p1_and_p2
		p1 = Human.new("X")
		p2 = SequentialAI.new("O")
		game = ConsoleGame.new(p1, p2)
		assert_equal("X", game.p1.marker)
		assert_equal("O", game.p2.marker)
	end

	def test_for_board
		p1 = Human.new("X")
		p2 = SequentialAI.new("O")
		game = ConsoleGame.new(p1, p2)
		assert_equal([" ", " ", " ", " ", " ", " ", " ", " ", " "], game.board.ttt_board)
	end

	def test_for_random_ai_p1_and_p2
		p1 = Human.new("X")
		p2 = RandomAI.new("O")
		game = ConsoleGame.new(p1, p2)
		assert_equal("X", game.p1.marker)
		assert_equal("O", game.p2.marker)
	end

	def test_for_current_player
		p1 = Human.new("X")
		p2 = RandomAI.new("O")
		game = ConsoleGame.new(p1, p2)
		assert_equal("O", game.current_player.marker)
	end

	def test_for_changing_current_player
		p1 = Human.new("X")
		p2 = RandomAI.new("O")
		game = ConsoleGame.new(p1, p2)
		game.change_player
		assert_equal(p1, game.current_player)
	end
end 