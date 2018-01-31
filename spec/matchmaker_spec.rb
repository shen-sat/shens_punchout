require_relative '../lib/matchmaker'

describe 'Matchmaker class' do 
	let(:player)	{Player.new}
	let(:conor) 	{Enemy.new}
	let(:jose) 		{Enemy.new}
	let(:max) 		{Enemy.new}
	let(:roster_fighters)	{Roster.new([conor, jose, max, player]).fighters}

	it 'should initialize with the roster minus player, and player' do 
		matchmaker = Matchmaker.new(roster_fighters, player)
		roster_fighters.delete(player) 
		expect(matchmaker.roster_edit).to eq(roster_fighters)
		expect(matchmaker.challenger).to eq(player)
	end

	it 'should initialize with roster and enemy' do 
		matchmaker = Matchmaker.new(roster, conor)
		expect(matchmaker.roster).to eq(roster)
		expect(matchmaker.challenger).to eq(conor)
	end

	it 'should pick an enemy at random for player to fight' do 
		matchmaker = Matchmaker.new(roster, player)
		#expect([1,2,3]).to include(1, 2).or include(1,3).or include(3,2)
		expect(matchmaker.make).to include(player, conor).or include(player, jose).or include(player, max)
	end


end