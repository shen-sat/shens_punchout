require_relative '../lib/enemy'

describe 'Enemy' do
	it 'should have a name, last name, nickname and rank' do 
		enemy = Enemy.new("Max", "Holloway", "The Blessed", 0)
		expect(enemy.first_name).to eq("Max")
		expect(enemy.last_name).to eq("Holloway")
		expect(enemy.nickname).to eq("The Blessed")
		expect(enemy.rank).to eq(0)
	end
end