require_relative '../lib/player_builder'

describe 'Player Builder class' do 
	it 'should set all attributes' do 
		player_builder = PlayerBuilder.new
		player = player_builder	.set_fname("Shen")
								.set_lname("Shamps")
								.set_nickname("The Sleepy")
								.set_rank(10)
								.build
		expect(player.fname).to eq("Shen")
		expect(player.lname).to eq("Shamps")
		expect(player.nickname).to eq("'The Sleepy'")
		expect(player.rank).to eq(10)
	end

end