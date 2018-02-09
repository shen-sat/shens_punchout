class Chat
	attr_accessor :catalogue
	
	def initialize(catalogue)
		@catalogue = catalogue
	end



	def prefight(challenged, challenger)
		last_fight(challenged, challenger)
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
=begin
	def fight_ratio(challenged, challenger)
		ratio = challenged.memory[challenger][0].to_f/(challenged.memory[challenger][1] + challenged.memory[challenger][0])
		puts "Mem is #{challenged.memory[challenger][0]/challenged.memory[challenger][1]}"
		if ratio >= 0.7
			x = :ratio_win
		elsif ratio <= 0.3
			x = :ratio_lose
		else
			x = :ratio_even
		end
		return @catalogue[challenged.personality][x].sample
	end
=end
end