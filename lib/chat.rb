class Chat
	attr_accessor :catalogue
	
	def initialize(catalogue)
		@catalogue = catalogue
	end



	def prefight(challenged, challenger)
		last_fight(challenged, challenger)
	end

	def last_fight(challenged, challenger)
		result = challenged.check_memory(challenger)[2]
		case result
		when true
			x = :won_last
		when false
			x = :lost_last
		else
			x = :never_met
		end
		return @catalogue[challenged.personality][x].sample
	end

	def fight_ratio(challenged, challenger)
		ratio = challenged.memory[challenger][0]/(challenged.memory[challenger][1] + challenged.memory[challenger][0])
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
end