require_relative '../lib/enemy'

describe 'Enemy class' do
	it 'should have writable attributes' do 
		enemy = Enemy.new
		enemy.fname = "Jose"
		enemy.lname = "Aldo"
		enemy.nickname = "Junior"
		enemy.rank = 0
		enemy.personality = {nice: 1}
		enemy.memory = {results: {"Frankie" => [2,0]}}
		expect(enemy.fname).to eq("Jose")
		expect(enemy.lname).to eq("Aldo")
		expect(enemy.nickname).to eq("Junior")
		expect(enemy.rank).to eq(0)
		expect(enemy.personality[:nice]).to eq(1)
	end

	
end

describe 'Enemy class during pre-fight stage' do 
	it 'should create a blank results record' do 
		enemy = Enemy.new
		enemy.memory = {}
		player = Player.new
		enemy.create_memory(player)
		expect(enemy.memory[player]).to eq([0,0,nil])
	end

	it 'should create a blank results record upon meeting a new opponent' do 
		enemy = Enemy.new
		enemy.memory = {}
		player = Player.new
		enemy.check_memory(player)
		expect(enemy.memory[player]).to eq([0,0,nil])
	end

	it 'should NOT create a new results record upon meeting a familar oppponent' do 
		enemy = Enemy.new
		player = Player.new
		enemy.memory = {player => [0,1,false]}
		enemy.check_memory(player)
		expect(enemy.memory[player]).to eq([0,1,false])
	end

	it 'should accept fight if challenged by a higher rank fighter' do 
		enemy = Enemy.new
		enemy.rank = 10
		player = Player.new
		player.rank = 9
		expect(enemy.accept_fight?(player)).to eq(true) 
	end	

	it 'should decline fight if opponent is ranked 3 places below' do 
		enemy = Enemy.new
		enemy.rank = 7
		player = Player.new
		player.rank = 10
		expect(enemy.accept_fight?(player)).to eq(false) 
	end

	it 'should accept fight if fighter rank is 8-10 and opponent is ranked nil' do 

	end


end