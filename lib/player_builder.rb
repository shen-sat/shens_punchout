class PlayerBuilder
	def initialize
		@player = Player.new
	end

	def set_fname(fname)
		@player.fname = fname
		self
	end

	def set_lname(lname)
		@player.lname = lname
		self
	end

	def set_nickname(nickname)
		@player.nickname = "'#{nickname}'"
		self
	end

	def set_rank(rank)
		@player.rank = rank.to_i
		self
	end

	def build
		return @player
	end
end