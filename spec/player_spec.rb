require_relative '../lib/player'

describe 'Player class' do 
	it 'should have writable attributes for name, last name, nickname and rank' do
		player = Player.new
		player.fname = "Frankie"
		player.lname = "Edgar"
		player.nickname = "The Answer"
		player.rank = 10
		expect(player.fname).to eq("Frankie")
		expect(player.lname).to eq("Edgar")
		expect(player.nickname).to eq("The Answer")
		expect(player.rank).to eq(10)
	end

end