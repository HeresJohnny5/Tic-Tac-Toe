require "minitest/autorun"
require_relative "unbeatable_ai.rb"

class TestWinOrBlock < Minitest::Test
	def test_X_takes_winning_space_two
		player = UnbeatableAI.new("X")
		assert_equal(2, player.get_move(["X", "X", " ", " ", " ", " ", "O", " ", "O"]))
	end

	def test_O_takes_winning_space_six
		player = UnbeatableAI.new("O")
		assert_equal(6, player.get_move(["X", "X", "O", " ", "O", " ", " ", " ", "X"]))
	end

	def test_X_takes_blocking_space_three
		player = UnbeatableAI.new("X")
		assert_equal(3, player.get_move(["X", " ", " ", " ", "O", "O", " ", " ", "X"]))
	end

	def test_X_takes_blocking_space_zero
		player = UnbeatableAI.new("X")
		assert_equal(0, player.get_move([" ", "O", "O", " ", "X", " ", " ", "X", " "]))
	end

	def test_O_takes_blocking_space_three
		player = UnbeatableAI.new("O")
		assert_equal(5, player.get_move(["X", " ", " ", "O", "O", " ", " ", "X", " "]))
	end
end

class TestForFork < Minitest::Test
	def test_X_fork_returns_zero
		player = UnbeatableAI.new("X")
		assert_equal(0, player.check_for_fork([" ", "X", " ", " ", "X", "O", " ", "O", " "]))
	end

	def test_X_fork_returns_six
		player = UnbeatableAI.new("X")
		assert_equal(6, player.check_for_fork([" ", "O", " ", " ", "X", "O", " ", "X", " "]))
	end

	def test_X_fork_returns_two
		player = UnbeatableAI.new("X")
		assert_equal(2, player.check_for_fork(["O", " ", " ", " ", " ", " ", "X", "O", "X"]))
	end

	def test_O_fork_returns_two
		player = UnbeatableAI.new("O")
		assert_equal(1, player.check_for_fork(["O", " ", " ", " ", " ", " ", "X", "O", "X"]))
	end
end

class TestBlockFork < Minitest::Test
	def method_name
		
	end
end

# class TestCenterMove < Minitest::Test
# 	def test_O_takes_center_returns_four
# 		player = UnbeatableAI.new("O")
# 		assert_equal(4, player.check_for_fork(["X", " ", " ", " ", " ", " ", " ", " ", " "]))	
# 	end	
# end

class TestUnbeatableAI < Minitest::Test
	def test_create_player_returns_players_marker
		player = UnbeatableAI.new("X")
		assert_equal("X", player.marker)
	end

	# def test_first_available_space_returned_one
 #        player = UnbeatableAI.new("X")
 #        assert_equal(1, player.get_move(["X", " ", " ", " ", " ", " ", " ", " ", " "]))
	# end

	# def test_first_available_space_returned_three
 #        player = UnbeatableAI.new("X")
 #        assert_equal(3, player.get_move(["X", "O", "X", " ", " ", "O", " ", "X", " "]))
	# end
end