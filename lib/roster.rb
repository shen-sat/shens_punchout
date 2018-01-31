class Roster
	attr_accessor :fighters
	
	def initialize(fighters)
		@fighters = fighters
	end

	def add(fighter)
		fighters.push(fighter)
	end
end