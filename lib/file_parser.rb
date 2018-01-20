class FileParser
	attr_reader :enemy_fnames, :enemy_lnames, :enemy_nicknames

	def initialize
		@enemy_fnames = File.read("C:/Users/Shen/Desktop/shens_punchout/assets/enemy_first_names.txt")
		@enemy_lnames = File.read("C:/Users/Shen/Desktop/shens_punchout/assets/enemy_last_names.txt")
		@enemy_nicknames = File.read("C:/Users/Shen/Desktop/shens_punchout/assets/enemy_nicknames.txt")		
	end

end
