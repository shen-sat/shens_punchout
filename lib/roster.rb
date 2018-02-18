class Roster
	attr_accessor :fighters
	
	def initialize(fighters)
		@fighters = fighters
	end

	def add(fighter)
		fighters.push(fighter)
	end

	def see
		table = ""
		fighters_sorted = fighters.sort_by {|fighter| fighter.rank}
		fighters_sorted.each do |fighter|
			row = "#{fighter.fname} #{fighter.nickname} #{fighter.lname}, #{fighter.rank}\n"
			table << row
		end
		return table
	end

	def add_player(player)
		@fighters.push(player)
	end
end