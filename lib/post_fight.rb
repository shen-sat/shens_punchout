class PostFight
	attr_accessor :winner, :loser
	def initialize(winner, loser)
		@winner = winner
		@loser = loser
	end

	def level_up
		winner.rank, loser.rank = loser.rank, winner.rank unless winner.rank < loser.rank
	end
end