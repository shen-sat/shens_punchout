class Matchmaker
	attr_accessor :roster_edit, :challenger
	def initialize(roster_fighters, challenger)
		@roster_edit = roster_fighters.reject!{|fighter| fighter==challenger}
		@challenger = challenger
	end

	def make

	end
end