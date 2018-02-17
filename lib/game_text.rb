class GameText
	def initialize
		welcome_1 = "Welcome to Shen's PunchOut!\n"
       	welcome_2 = "In this game you will play a new, up-and-coming fighter.\n"
       	welcome_3 = "The other fighters in your roster are randomly generated, with unique personalities. 
       				They will fight you and each other in order to become: PunchOut Champion!".split.join(" ")
       	welcome_4 = "\n"
       	return welcome_1 + welcome_2 + welcome_3 + welcome_4
	end

	def ask_fname
		return "Please enter your first name:"
	end

	def ask_lname
		return "Please enter your last name:"
	end

	def ask_nickname
		return "Please enter your nickname:"
	end

	def ask_roster_size
		return "Please enter roster size:"
	end

end
