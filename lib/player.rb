class Player
	attr_reader :first_name, :last_name, :nickname, :rank
	
	def initialize(first_name, last_name, nickname, rank)
		@first_name = first_name
		@last_name = last_name
		@nickname = nickname
		@rank = rank
	end

end