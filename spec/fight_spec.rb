require_relative '../lib/fight'

describe 'Fight class' do 
	let(:conor)		{Enemy.new}
	let(:jose)		{Enemy.new}
	let(:player)	{Player.new}

	it 'should take in and store challenged and challenger' do 
		fight = Fight.new(conor,player)
		expect(fight.challenged).to eq(conor)
		expect(fight.challenger).to eq(player) 
	end

	it 'should return challenged as winner and vice versa if parameter true is passed' do 
		fight = Fight.new(conor,player)
		expect(fight.retain_rank("true")).to eq([conor,player])
	end

	it 'should return challenger as winner and vice versa if parameter false is passed' do 
		fight = Fight.new(conor,player)
		expect(fight.retain_rank("false")).to eq([player,conor])
	end

end