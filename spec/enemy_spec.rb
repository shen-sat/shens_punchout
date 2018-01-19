require_relative '../lib/enemy'

describe 'Enemy class' do
	it 'should have writable attributes' do 
		enemy = Enemy.new
		enemy.fname = "Jose"
		enemy.lname = "Aldo"
		enemy.nickname = "Junior"
		enemy.rank = 0
		expect(enemy.fname).to eq("Jose")
		expect(enemy.lname).to eq("Aldo")
		expect(enemy.nickname).to eq("Junior")
		expect(enemy.rank).to eq(0)
	end
end