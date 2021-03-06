class Matchmaker
	attr_accessor :fighters, :challenger, :challenged
	def initialize(roster, challenger)
		@fighters = roster.fighters.reject{|fighter| fighter==challenger}
		@challenger = challenger
	end

	def choose
		@challenged = @fighters.sample
	end

	def meet
		@challenged.check_memory(@challenger)
		@challenger.check_memory(@challenged) unless !@challenger.is_a?(Enemy)
	end

	def announce
		return "Upcoming fight: " + 
		"#{challenged.fname} #{challenged.nickname} #{challenged.lname} to face " + 
		"#{challenger.fname} #{challenger.nickname} #{challenger.lname}!"
	end

end