require_relative '../lib/enemy_builder'

describe 'Enemy Builder class' do 
	it 'should set an an Enemy object fname to "Conor"' do
		enemy_builder = EnemyBuilder.new
		enemy_builder.set_fname("Conor")
		expect(enemy_builder.enemy.fname).to eq("Conor")
	end

	it 'should set an an Enemy object lname to "McGregor"' do
		enemy_builder = EnemyBuilder.new
		enemy_builder.set_lname("McGregor")
		expect(enemy_builder.enemy.lname).to eq("McGregor")
	end

	it 'should set an an Enemy object nickname to "Notorious"' do
		enemy_builder = EnemyBuilder.new
		enemy_builder.set_nickname("Notorious")
		expect(enemy_builder.enemy.nickname).to eq("Notorious")
	end

	it 'should set an an Enemy object rank to 1' do
		enemy_builder = EnemyBuilder.new
		enemy_builder.set_rank(1)
		expect(enemy_builder.enemy.rank).to eq(1)
	end
end