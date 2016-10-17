require_relative 'ttt_app.rb'
require 'minitest/autorun'

class TestCSV < Minitest::Test

	def test_file_length_returns_2
		player_1 = "John"
		player_2 = "Cheri"
		winner = "John"
		write_to_csv(player_1, player_2, winner)
		assert_equal(2, check_file_length())
	end

	def test_file_length_returns_3
		player_1 = "John"
		player_2 = "Cheri"
		winner = "John"
		write_to_csv(player_1, player_2, winner)
		assert_equal(3, check_file_length())
	end

end