class FileParser
	attr_reader :enemy_fnames, :enemy_lnames, :enemy_nicknames
	

	def initialize(enemy_fnames, enemy_lnames, enemy_nicknames)
		@enemy_fnames = enemy_fnames.split("\n").to_a
		@enemy_lnames = enemy_lnames.split("\n").to_a
		@enemy_nicknames = enemy_nicknames.split("\n").to_a	
	end

end
