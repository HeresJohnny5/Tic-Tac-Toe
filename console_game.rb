require_relative "sequential_ai.rb"
require_relative "human.rb"
require_relative "random_ai.rb"
require_relative "new_tic_tac.rb"
require_relative "unbeatable_ai.rb"

class ConsoleGame

	attr_accessor :p1, :p2, :board, :current_player

	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
		@board = Board.new
		@current_player = p2
	end

	def change_player
		if @current_player == p1
			@current_player = p2
		else
			@current_player = p1
		end
	end

	def start_game()
		puts "Welcome to Tic-Tac-Toe"
	end

	def board_status()
	 	puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
	 	puts "-----------"
	 	puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	 	puts "-----------"
	 	puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	 	puts

	 	if current_player == p2
	 		player = p1
	 	else
	 		player = p2
	 	end

	 	if board.game_won?(current_player.marker) == false && board.game_ends_in_tie?() == false
			puts "It is #{player.marker} turn."
		end	
	end

	def get_player_move
		current_player.get_move(board.ttt_board)
	end

	def make_move(move)
		board.update_board(move, current_player.marker)
	end

	def game_over?
		board.game_won?(current_player.marker) ||
		board.game_ends_in_tie?()
	end

	def winner
		if board.game_won?(current_player.marker)
			puts "#{current_player.marker} is the winner!"
		else
			puts "The game is a tie."
		end
	end
	
end