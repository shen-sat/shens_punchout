class RosterMaker
	attr_reader
	def initialize(size, fnames, lnames, nicknames)
		@size = size
		@ranks = (0..(size-1)).to_a
		@fnames = fnames
		@lnames = lnames
		@nicknames = nicknames

	end

	def make
		enemy_builder = EnemyBuilder.new
		chosen = []
		@size.times do
			fname = @fnames.sample
			lname = @lnames.sample
			nickname = @nicknames.sample
			rank = @ranks[0]
			chosen.push(enemy_builder	.set_rank(@ranks.delete(rank))
										.set_fname(@fnames.delete(fname))
										.set_lname(@lnames.delete(lname))
										.set_nickname(@nicknames.delete(nickname))
										.build)
		end
		Roster.new(chosen)
	end

end