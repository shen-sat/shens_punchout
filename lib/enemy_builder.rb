class EnemyBuilder
	def initialize
		@enemy = Enemy.new
	end
	
	def set_fname(fname)
		@enemy.fname = fname
	end

	def set_lname(lname)
		@enemy.lname = lname
	end

	def set_nickname(nickname)
		@enemy.nickname = nickname
	end
	
	def set_rank(rank)
		@enemy.rank = rank
	end

	def enemy
		@enemy
	end
end