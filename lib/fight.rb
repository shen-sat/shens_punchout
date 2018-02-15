class Fight
	attr_accessor :challenged, :challenger
	def initialize(challenged, challenger)
		@challenged = challenged
		@challenger = challenger  
	end

	def retain_rank(outcome)
		return (outcome == true ? [challenged, challenger] : [challenger, challenged])
	end
end