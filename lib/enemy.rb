require_relative './player'

class Enemy < Player
	attr_accessor :traits, :memory

	def create_memory(opp)
		@memory[opp] = [0,0,nil]
	end

	def check_memory(opp)
		create_memory(opp) unless @memory[opp]
	end

	def accept_fight?(opp)
		return true if opp.rank < self.rank
		return false if opp.rank - self.rank > 2		
	end

end