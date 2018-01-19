class EnemyData
	attr_reader :first_names, :last_names, :nicknames
	def initialize
		  @first_names = []
		  @last_names = []
		  @nicknames = []
		  File.open("../assets/enemy_first_names.txt").each {|n| @first_names.push(n)}
		  File.open("../assets/enemy_last_names.txt").each {|n| @last_names.push(n)}
		  File.open("../assets/enemy_nicknames.txt").each {|n| @nicknames.push(n)}
	end

end



