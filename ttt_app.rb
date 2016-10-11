require 'sinatra'
require_relative 'new_tic_tac.rb'
require_relative 'human.rb'
require_relative 'sequential_ai.rb'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require 'sinatra/reloader' if development?

# post routes come from the form action
# params come from form names

enable :sessions

get '/' do
	@title = "Welcome to Tic Tac Toe"
	session[:board] = Board.new
	erb :home, :locals => { :board => session[:board].board_positions }
end

post '/game' do
	player_1 = params[player_1]
	player_2 = params[player_2]

	if player_1 == "human"
		session[:p1] = Human.new("X")
	elsif player_1 == "sequential_ai"
		session[:p1] = SequentialAI.new("X")
	elsif player_1 == "random_ai"
		session[:p1] = RandomAI.new("X")
	else player_1 == "unbeatable_ai"
		session[:p1] = UnbeatableAI.new("X")
	end	

	if player_2 == "human"
		session[:p2] = Human.new("O")
	elsif player_2 == "sequential_ai"
		session[:p2] = SequentialAI.new("O")
	elsif player_2 == "random_ai"
		session[:p2] = RandomAI.new("O")
	else player_2 == "unbeatable_ai"
		session[:p2] = UnbeatableAI.new("O")
	end

	session[:current_player] = session[:p1]

	erb :get_move, :locals => { :current_player => session[:current_player], :p1 => session[:p1], :p2 => session[:p2], :board => session[:board].board_positions }		
end

get '/get_move' do
	erb :get_move
end

post '/get_player_move' do
	move_spot = params[:move_spot].to_i

	session[:board].update_board((move_spot - 1), session[:current_player].marker)

	if session[:board].game_won?(session[:current_player].marker) == true
		erb :win, :locals => { :current_player => session[:current_player], :p1 => session[:p1], :p2 => session[:p2], :board => session[:board].board_positions }
	elsif session[:board].game_ends_in_tie? == true
		erb :tie, :locals => { :current_player => session[:current_player], :p1 => session[:p1], :p2 => session[:p2], :board => session[:board].board_positions }
	else
		if session[:current_player].marker == "X"
			session[:current_player] = session[:p2]
		else
			session[:current_player] = session[:p1]
		end

		erb :get_move, :locals => { :current_player => session[:current_player], :p1 => session[:p1], :p2 => session[:p2], :board => session[:board].board_positions }

	end	
end

get '/win' do 
end

get '/tie' do
end