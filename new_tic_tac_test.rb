require "minitest/autorun"
require_relative "new_tic_tac.rb"

class TestBoard <Minitest::Test
	def test_new_board_created
		board = Board.new()
		assert_equal([" ", " ", " ", " ", " ", " ", " ", " ", " "], board.ttt_board)
	end

	#updating board
	def test_new_board_with_x_at_index_position_0
		board = Board.new()
		board.update_board(0, "X")
		assert_equal(["X", " ", " ", " ", " ", " ", " ", " ", " "], board.ttt_board)
	end

	def test_update_partially_full_board_with_o_at_index_position_4
		board = Board.new()
		board.ttt_board = ["X", "O", " ", " ", " ", " ", "O", " ", "X"]
		board.update_board(4, "O")
		assert_equal(["X", "O", " ", " ", "O", " ", "O", " ", "X"], board.ttt_board)
	end

	def test_for_valid_space
		board = Board.new()
		board.ttt_board = ["X", "O", " ", " ", " ", " ", "O", " ", "X"]
		assert_equal(true, board.valid_space?(2))
	end

	def test_for_valid_space_returns_false
		board = Board.new()
		board.ttt_board = ["X", "O", " ", " ", " ", " ", "O", " ", "X"]
		assert_equal(false, board.valid_space?(-1))
	end

	def test_for_full_board_returns_true_tie
		board = Board.new()
		board.ttt_board = ["X", "O", "X", "O", "O", "X", "O", "X", "O"]
		assert_equal(true, board.game_ends_in_tie?)
	end

	def test_new_board_returns_false_for_tie
		board = Board.new()
		assert_equal(false, board.game_ends_in_tie?)
	end

	def test_new_board_returns_false_for_win
		board = Board.new()
		marker = "X"
		assert_equal(false, board.game_won?(marker))
	end

	def test_bottom_row_returns_true_for_win
		board = Board.new()
		marker = "X"
		board.ttt_board = ["O", "O", "X", "O", "X", "O", "X", "X", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_top_row_returns_true_for_win_with_O
		board = Board.new()
		marker = "O"
		board.ttt_board = ["O", "O", "O", "O", "X", "O", "X", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_top_row_returns_true_for_win_with_X
		board = Board.new()
		marker = "X"
		board.ttt_board = ["X", "X", "X", "X", "X", "X", "X", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_middle_row_returns_true_for_win_with_X
		board = Board.new()
		marker = "X"
		board.ttt_board = ["X", "X", "X", "X", "X", "X", "X", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_middle_row_returns_true_for_win_with_O
		board = Board.new()
		marker = "O"
		board.ttt_board = ["X", "X", "X", "O", "O", "O", "X", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_first_column_returns_true_for_win_with_X
		board = Board.new()
		marker = "X"
		board.ttt_board = ["X", "X", "X", "X", "X", "X", "X", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_first_column_returns_true_for_win_with_O
		board = Board.new()
		marker = "O"
		board.ttt_board = ["O", "X", "X", "O", "X", "X", "O", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_second_column_returns_true_for_win_with_X
		board = Board.new()
		marker = "X"
		board.ttt_board = ["X", "X", "X", "O", "X", "X", "X", "X", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_second_column_returns_true_for_win_with_O
		board = Board.new()
		marker = "O"
		board.ttt_board = ["X", "O", "X", "O", "O", "X", "X", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_third_column_returns_true_for_win_with_X
		board = Board.new()
		marker = "X"
		board.ttt_board = ["X", "O", "X", "O", "O", "X", "X", "O", "X"]
		assert_equal(true, board.game_won?(marker))
	end

	def test_third_column_returns_true_for_win_with_O
		board = Board.new()
		marker = "O"
		board.ttt_board = ["X", "O", "O", "O", "O", "O", "X", "O", "O"]
		assert_equal(true, board.game_won?(marker))
	end
end