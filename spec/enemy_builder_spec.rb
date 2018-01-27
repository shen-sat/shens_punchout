require_relative '../lib/enemy_builder'

describe 'Enemy Builder class' do 
	it 'should create an Enemy object from specified attributes' do
		enemy_builder = EnemyBuilder.new
		conor =	enemy_builder	.set_fname("Conor")
								.set_lname("McGregor")
								.set_nickname("Notorious")
								.set_rank(1)
								.set_traits({nice: 1, mean: 7})
								.set_memory({})
								.build
		expect(conor.fname).to eq("Conor")
		expect(conor.lname).to eq("McGregor")
		expect(conor.nickname).to eq("Notorious")
		expect(conor.rank).to eq(1)
		expect(conor.traits[:nice]).to eq(1)
		expect(conor.traits[:mean]).to eq(7)

	end

	it 'should return 2 enemies with different names using one instance of itself' do 
		enemy_builder = EnemyBuilder.new
		enemy_one = enemy_builder.set_fname("Jose").build
		enemy_two = enemy_builder.set_fname("Conor").build
		expect(enemy_one.fname).to eq("Jose")
		expect(enemy_two.fname).to eq("Conor")
	end

end