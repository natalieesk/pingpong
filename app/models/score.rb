class Score < ActiveRecord::Base

	has_many :games, order: 'id ASC'
	belongs_to :player
	belongs_to :match
	after_create :add_first_game

	def add_first_game
		self.games << Game.create(number: 1)
	end

	def new_game
		prev_game = games.last
		self.games << Game.create(number: prev_game.number + 1)
	end

	def game(num)
		games[num-1]
	end

	def match_finished?
		won_games == 2
	end

	def game_won	
		update_attribute(:won_games,won_games + 1)
		if !match_finished?
			new_game
			match.update_oppositions_game_number
		end
	end

	def game_completed
		current_game.tap { |g| g.completed = true }.save
	end

	def game_not_completed
		current_game.tap { |g| g.completed = false }.save
	end

	def current_game
		self.games.last
	end

end
