module MatchesHelper

	def table_data(match)
		{:p1g1 => match.score(1).games[0].points, 
			:p2g1 => match.score(2).games[0].points,
			:g1winner => match.game_winner(1),
			:p1g2 => match.score(1).games[1].try(:points) || 0,
			:p2g2 => match.score(2).games[1].try(:points) || 0,
			:g2winner => match.game_winner(2),
			:p1g3 => match.score(1).games[2].try(:points) || 0,
			:p2g3 => match.score(2).games[2].try(:points) || 0,
			:g3winner => match.game_winner(3)}
	end
end