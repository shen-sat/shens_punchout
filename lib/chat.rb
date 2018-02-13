class Chat
	attr_accessor :catalogue
	
	def initialize(catalogue)
		@catalogue = catalogue
	end

	def last_fight(challenged, challenger)
		statements = []
		result = challenged.memory[challenger][2]
		case result
		when true
			a = :won_last
			b = :lost_last
		when false
			a = :lost_last
			b = :won_last
		else
			a = :never_met
			b = a
		end
		statements.push(@catalogue[challenged.personality][a].sample)
		statements.push(@catalogue[challenger.personality][b].sample) unless !challenger.is_a?(Enemy)
		return statements
	end

	def postfight(winner,loser)
		statements = []
		statements.push(@catalogue[winner.personality][:post_win].sample) unless !winner.is_a?(Enemy)
		statements.push(@catalogue[loser.personality][:post_loss].sample) unless !loser.is_a?(Enemy)
		return statements
	end

end