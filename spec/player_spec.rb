require_relative '../lib/player'

describe 'Player' do
	it 'should have a first name: Frankie' do 
		player = Player.new("Frankie", nil, nil, nil)
		expect(player.first_name).to eq("Frankie")

	end

	it 'should have a second name: Edgar' do 
		player = Player.new("Frankie", "Edgar", nil, nil)
		expect(player.last_name).to eq("Edgar")

	end

	it 'should have a nickname: "The Answer"' do 
		player = Player.new("Frankie", "Edgar", "The Answer", nil)
		expect(player.nickname).to eq("The Answer")

	end

	it 'should have a rank of 15' do 
		player = Player.new("Frankie", "Edgar", "The Answer", 15)
		expect(player.rank).to eq(15)

	end

end