class PostFight
	attr_accessor :winner, :loser
	def initialize(winner, loser)
		@winner = winner
		@loser = loser
	end

	def level_up
		winner.rank, loser.rank = loser.rank, winner.rank unless winner.rank < loser.rank
	end

	def amend_memories
		if loser.is_a?(Enemy)
			loser.memory[winner][1] += 1
			loser.memory[winner][2] = false
		end
		if winner.is_a?(Enemy)
			winner.memory[loser][0] += 1
			winner.memory[loser][2] = true
		end
	end
end