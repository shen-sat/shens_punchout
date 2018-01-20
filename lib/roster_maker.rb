class RosterMaker
	
	def initialize(size)
		@size = size
		@ranks = (0..(size-1)).to_a
	end

	def make
		enemy_builder = EnemyBuilder.new
		chosen = []
		@size.times do
			chosen.push(enemy_builder.set_rank(@ranks[0]).build)
			@ranks.shift
		end
		Roster.new(chosen)
	end

end