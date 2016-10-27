# Win: If the player has two in a row, they can place a third to get three in a row.
# Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
# Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).

# Blocking an opponent's fork:
# Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)

# Option 2: If there is a configuration where the opponent can fork, the player should block that fork.

# Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)

# Opposite corner: If the opponent is in the corner, the player plays the opposite corner.

# Empty corner: The player plays in a corner square.
# Empty side: The player plays in a middle square on any of the 4 sides.

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
		elsif check_for_fork(ttt_board) <= 8
			move = check_for_fork(ttt_board)
		else
			move = ttt_board.index(" ")
		end
		move
	end

	def check_for_win(ttt_board, your_marker)
		win_or_block(ttt_board, your_marker)
	end

	def check_for_block(ttt_board, opponent_marker)
		win_or_block(ttt_board, opponent_marker)
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

		fork_spot.detect { |match| fork_spot.count(match) > 1 }
	end

	def block_opponents_fork(ttt_board)
		block_fork_combinations = [
								[ttt_board[0],ttt_board[1],ttt_board[2]],
								[ttt_board[3],ttt_board[4],ttt_board[5]],
								[ttt_board[6], ttt_board[7], ttt_board[8]],
								[ttt_board[0], ttt_board[3], ttt_board[6]],
								[ttt_board[1],ttt_board[4], ttt_board[7]],
								[ttt_board[2],ttt_board[5],ttt_board[8]], 
								[ttt_board[0], ttt_board[4], ttt_board[8]],
								[ttt_board[2],ttt_board[4],ttt_board[6]]
								]

		block_fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		if marker == "X"
			p2_marker = "O"
		else
			p2_marker = "X"
		end

		block_fork_line = []
		block_fork_spot = []
		i = []
		
		block_fork_combinations.each_with_index do |block_forking_line, index|
			if block_forking_line.count(marker) == 1 && block_forking_line.count(" ") == 2
				block_fork_line = block_forking_line
				i.push(index)
			end
		end

		i.each do |index|
			block_fork_spot.push(block_fork_positions[index])
		end

		block_fork_spot = block_fork_spot.flatten

		block_spot = []
		block_fork_spot.each do |spot|
			if ttt_board[spot] == " "
				block_spot.push(spot)
			end
		end

		block_spot_first = block_spot.shift
	end

end