class EnemyBuilder
	#attr_accessor :enemy
	
	def initialize
		@enemy = Enemy.new
	end
	
	def set_fname(fname)
		@enemy.fname = fname
		self
	end

	def set_lname(lname)
		@enemy.lname = lname
		self
	end

	def set_nickname(nickname)
		@enemy.nickname = nickname
		self
	end
	
	def set_rank(rank)
		@enemy.rank = rank
		self
	end

	def build
		obj = @enemy
		@enemy = Enemy.new
		return obj
	end
end