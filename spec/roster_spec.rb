require_relative '../lib/roster'

describe 'Roster class' do 
	it 'should hold an array of enemies' do 
		chosen = [Enemy.new, Enemy.new]
		roster = Roster.new(chosen)
		expect(roster.fighters).to eq(chosen) 
	end

	it 'should add player' do 
		chosen = [Enemy.new, Enemy.new]
		roster = Roster.new(chosen)
		player = Player.new
		roster.add(player)
		expect(roster.fighters).to include(player) 
	end

	it 'should display roster by rank when requested' do 
		jose = EnemyBuilder.new
							.set_fname("Jose")
							.set_lname("Aldo")
							.set_nickname("'Junior'")
							.set_rank(1)
							.build

		conor = EnemyBuilder.new
							.set_fname("Conor")
							.set_lname("McGregor")
							.set_nickname("'The Notorious'")
							.set_rank(0)
							.build
		player = Player.new
		player.fname = "Shen"
		player.lname = "Shamps"
		player.nickname = "'The Sleepy'"
		player.rank = 2
		roster = Roster.new([jose,conor,player])
		expect(roster.see).to eq("Conor 'The Notorious' McGregor, 0\nJose 'Junior' Aldo, 1\nShen 'The Sleepy' Shamps, 2\n")
	end

	it 'should add player' do 
		chosen = [Enemy.new, Enemy.new]
		roster = Roster.new(chosen)
		player = Player.new
		roster.add_player(player)
		expect(roster.fighters).to include(player)
	end	
end