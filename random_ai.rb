class RandomAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end
	
	def get_move(board)
		n = rand(1..9)

		if valid_space?(board, n) == false
			get_move(board)
		else
			n
		end
	end

	def valid_space?(board, choice)
		board[choice] != "X" || board[choice] != "O"
	end

	def array
		array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	end
	
end

# def get_move(board)
# 	move = []
# 	i = 0
# 		board.each do  |board_spot|

# 		if board_spot == " "
# 			move.push(i)
# 		end
# 		i = i + 1
# 		end
# 	move.sample
# end