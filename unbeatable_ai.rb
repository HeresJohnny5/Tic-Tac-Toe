class UnbeatableAI
	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(ttt_board)
		your_marker = marker
		
		if your_marker == "X"
			opponent_marker = "O"
		else
			opponent_marker = "X"
		end

		if check_for_win(ttt_board, your_marker) <= 8
			move = check_for_win(ttt_board, your_marker)
		elsif check_for_block(ttt_board, opponent_marker) <= 8
			move = check_for_block(ttt_board, opponent_marker)
		else
			move = ttt_board.index(" ")
		end
		move
	end

	def win_or_block(ttt_board, current_marker)
		winning_or_block_combinations = [
							[ttt_board[0],ttt_board[1],ttt_board[2]],
							[ttt_board[3],ttt_board[4],ttt_board[5]],
							[ttt_board[6], ttt_board[7], ttt_board[8]],
							[ttt_board[0], ttt_board[3], ttt_board[6]],
							[ttt_board[1],ttt_board[4], ttt_board[7]],
							[ttt_board[2],ttt_board[5],ttt_board[8]], 
							[ttt_board[0], ttt_board[4], ttt_board[8]],
							[ttt_board[2],ttt_board[4],ttt_board[6]]
							]

		win_or_block_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		pick = 10
		
		winning_or_block_combinations.each_with_index do |win_or_block_line, index|
			if win_or_block_line.count(current_marker) == 2 && win_or_block_line.count(" ") == 1
				winner_or_block = win_or_block_line.index(" ")
				i = index
				pick = win_or_block_positions[i][winner_or_block]
			end
		end
		pick
	end

	def check_for_win(ttt_board, your_marker)
		win_or_block(ttt_board, your_marker)
	end

	def check_for_block(ttt_board, opponent_marker)
		win_or_block(ttt_board, opponent_marker)
	end

	def check_for_fork(ttt_board)
		fork_combinations = [
							[ttt_board[0],ttt_board[1],ttt_board[2]],
							[ttt_board[3],ttt_board[4],ttt_board[5]],
							[ttt_board[6], ttt_board[7], ttt_board[8]],
							[ttt_board[0], ttt_board[3], ttt_board[6]],
							[ttt_board[1],ttt_board[4], ttt_board[7]],
							[ttt_board[2],ttt_board[5],ttt_board[8]], 
							[ttt_board[0], ttt_board[4], ttt_board[8]],
							[ttt_board[2],ttt_board[4],ttt_board[6]]
							]

		fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		fork_line = []
		fork_spot = []
		i = []
		i2 = 0
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(marker) == 1 && forking_line.count(" ") == 2
				fork_line = forking_line
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot.push(fork_positions[index])
		end

		fork_spot = fork_spot.flatten

		fork_spot.detect { |match| fork_spot.count(match) > 1}
	end
end