require_relative './player'

class Enemy < Player
	attr_accessor :personality, :memory

	def create_memory(opp)
		@memory[opp] = [0,0,nil]
	end

	def check_memory(opp)
		create_memory(opp) unless @memory[opp]
	end

	def accept_fight?(challenger)
		if challenger.rank < self.rank || challenger.rank - self.rank  <= 2
			return true
		else
			return false
		end
	end

end