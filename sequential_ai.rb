class SequentialAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		n = board.index(" ")
		choice = n + 1

		if valid_space?(board, choice) == false
			get_move(board)
		else
			choice
		end
	end

	def valid_space?(board, choice)
		board[choice] != "X" || board[choice] != "O"
	end
	
end