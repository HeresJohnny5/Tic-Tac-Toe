require_relative "console_game.rb"

p1 = Human.new("X")
p2 = Human.new("O")
game = ConsoleGame.new(p1, p2)

# array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

game.start_game()
game.board_status()

until game.game_over?
	game.change_player
	move = game.get_player_move
	game.make_move(move)
	game.board_status
end
game.winner

# Line 9 is executing the 'ConsoleGame' instance 'game', specifically the method 'start_game' which is a method unique to the class 'ConsoleGame'. The method 'start_game' welcomes the player.

# Line 10 is executing the 'ConsoleGame' instance 'game', specifically the method 'board_status' which is a method unique to the class 'ConsoleGame' which outputs the board. The board itself is a class, nested within the class 'ConsoleGame'. The method 'board_status' calls the 'Board' class, specifically the method 'ttt_board', which is a method unique to the class 'Board' which is an array of empty strings. This displays the tic tac toe board to the console. There is a conditional statement: changing the instance variable 'p1' to variable 'player 1' if 'current_player' is equal to instance variable 'p2' which it is. There's also another conditional statement, which states if the game is not won and is not a tie, output 'It is #{player.marker} turn'. Due to the first conditional instance variable 'p1' is now variable 'player' and player has access to the argument 'marker' which for 'p1' is set to the string "X".

# Line 12 starts the until loop, looping through the code block until the method 'game_over?' unique to the class 'ConsoleGame' instance 'game' returns true. The method 'game_over?' will return true if either the method 'game_won?' or 'game_ends_in_tie?', both unique to class Board return true.

# Line 13 executes the method 'change_player' unique to the 'ConsoleGame' instance 'game'. This in effect changes the instance variable 'current_player' from 'p2' to 'p1', which is set to the variable "X".

# Line 14 executes the 'get_player_move' method which is unique to the 'ConsoleGame' instance 'game'. The 'get_player_move' method executes the instance 'current_player', specifically the 'get_move' method, passing in the argument 'board.ttt_board'. The 'get_move' method asks the user to pick a space, which has conditional statement; if the variable 'move' is equal to a empty string return the integer 'move' else let the player know the move is invalid and execute the 'get_move' method again.

# After the method 'get_player_move' is run, the next to execute is method 'make_move'. The 'make_move' method calls upon the 'Board' class specifically the 'update_board' method passing in two arguments, 'move' which is the return value of the method 'get_move' and 'current_player.marker' which is currently set to 'p1' or "X". All the method 'update_board' does is update the array 'ttt_board' with the position, which is set to return value of 'get_move' and marker, which is set to 'p1' or "X".

# Line 16 executes the 'ConsoleGame' instance 'game', speicically the method 'board_status' which is a method unique to the class 'ConsoleGame' which outputs the board.

# The loop continues until the method 'game_over?' unique to the class 'ConsoleGame' instance 'game' returns true. The method 'game_over?' will return true if either the method 'game_won?' or 'game_ends_in_tie?', both unique to class Board return true.

# ??? There may be a problem w/ 'get_move' in the 'Human' class as when asked to make a move I can input a character outside of a integer and it will place me in the 0 index.