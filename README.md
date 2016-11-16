# Tic Tac Toe App

The Tic Tac Toe App allows the player to play against another human opponent or AI storing results in a database. The AI has 3 different difficulties:

1. Easy - SequentialAI
	* Sequential will take the first available/valid position
2. Medium - RandomAI
	* Random will take a random available/valid position
3. Hard - UnbeatableAI
	* Cannot be beat. The player at best can tie the UnbeatableAI. The **get_move method** found on the **unbeatable_ai.rb** houses a sequence of method calls. The UnbeatableAI will check the following order:
		* check_for_win
		* check_for_block
		* check_for_fork
		* block_opponents_fork
		* check_for_center
		* opponent_corner
		* check_empty_corner
		* check_empty_side

Results are accessible when the game has ended regardless of the result (win or tie). Results are stored in a database providing record of the following columns:

1. Player 1
2. Player 2
3. Winner
4. Date - Time

## Run ttt_app.rb to run the app

If you don't have *sinatra-reloader gem* please hash out **require 'sinatra/reloader' if development?** on ttt_app.rb