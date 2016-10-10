class Board
	attr_accessor :ttt_board
	def initialize()
		@ttt_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def board_positions()
		new_board = []
		ttt_board.each_with_index do |value, index|
			if value == "X" || value == "O"
				new_board.push(value)
			else
				new_board.push(index + 1)
			end
		end
		new_board
	end

	def update_board(position, marker)
		ttt_board[position] = marker
	end

	def valid_space?(position)
	ttt_board[position] == " " && position >= 0 && position <= 8
	end

	def game_ends_in_tie?
		ttt_board.count(" ") == 0
	end

	def game_won?(marker)
		 
		# ttt_board[0] == marker && ttt_board[1] == marker && ttt_board[2] == marker ||
		# ttt_board[3] == marker && ttt_board[4] == marker && ttt_board[5] == marker ||
		# ttt_board[6] == marker && ttt_board[7] == marker && ttt_board[8] == marker ||
		# ttt_board[0] == marker && ttt_board[3] == marker && ttt_board[6] == marker ||
		# ttt_board[1] == marker && ttt_board[4] == marker && ttt_board[7] == marker ||
		# ttt_board[2] == marker && ttt_board[5] == marker && ttt_board[8] == marker

		result = false
		winning_combo = [[ttt_board[0],ttt_board[1],ttt_board[2]],
                         [ttt_board[3],ttt_board[4],ttt_board[5]],
                         [ttt_board[6],ttt_board[7],ttt_board[8]],
                         [ttt_board[0],ttt_board[3],ttt_board[6]],
                         [ttt_board[1],ttt_board[4],ttt_board[7]],
                         [ttt_board[2],ttt_board[5],ttt_board[8]],
                         [ttt_board[0],ttt_board[4],ttt_board[8]],
                         [ttt_board[2],ttt_board[4],ttt_board[6]]]

        winning_combo.each do |winner|
        	if winner.count(marker) == 3
        		result = true
        	end
        end
        result
	end
end