require_relative '../lib/matchmaker'

describe 'Matchmaker class' do 
	let(:player)	{Player.new}
	let(:conor) 	{EnemyBuilder.new.set_fname("Conor").set_lname("McGregor").set_nickname("'The Notorious'").build}
	let(:jose) 		{EnemyBuilder.new.set_fname("Jose").set_lname("Aldo").set_nickname("'Junior'").build}
	let(:max) 		{EnemyBuilder.new.set_fname("Max").set_lname("Holloway").set_nickname("'Blessed'").build}
	let(:roster)	{Roster.new([conor, jose, max, player])}

	it 'should initialize with the roster minus player, and player' do 
		matchmaker = Matchmaker.new(roster, player)
		roster.fighters.delete(player) 
		expect(matchmaker.fighters).to eq(roster.fighters)
		expect(matchmaker.challenger).to eq(player)
	end

	it 'should initialize with roster and enemy' do 
		matchmaker = Matchmaker.new(roster, conor)
		roster.fighters.delete(conor) 
		expect(matchmaker.fighters).to eq(roster.fighters)
		expect(matchmaker.challenger).to eq(conor)
	end

	it 'should pick an enemy at random for player to fight' do 
		matchmaker = Matchmaker.new(roster, player)
		matchmaker.choose
		expect(matchmaker.challenged).to eq(conor).or eq(jose).or eq(max)
	end

	it 'should state Jose is fighting player, Shen' do 
		player.fname = "Shen"
		player.lname = "Shamps"
		player.nickname = "'The Asleep'"
		matchmaker = Matchmaker.new(roster, player)
		matchmaker.challenged = jose
		expect(matchmaker.announce)
		.to eq("Upcoming fight: Jose 'Junior' Aldo to face Shen 'The Asleep' Shamps!")
	end

	it 'should state Max is fighting enemy, Conor' do 
		matchmaker = Matchmaker.new(roster, conor)
		matchmaker.challenged = max
		expect(matchmaker.announce)
		.to eq("Upcoming fight: Max 'Blessed' Holloway to face Conor 'The Notorious' McGregor!")
	end


end