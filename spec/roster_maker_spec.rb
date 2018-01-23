require_relative '../lib/roster_maker'

describe 'Roster Maker class' do 
	let(:fnames)	{["Jose", "Conor", "Max"]}
	let(:lnames)	{["Aldo", "McGregor", "Holloway"]}
	let(:nicknames)	{["Junior", "Notorious", "Blessed"]}
	
	it 'should create a roster with 5 opponents' do 
		roster_maker = RosterMaker.new(5, fnames,lnames,nicknames)
		expect(roster_maker.make.fighters.length).to eq(5)
	end
	it 'should create a roster with 3 ranked opponents, 0-2' do 
		roster_maker = RosterMaker.new(3,fnames,lnames,nicknames)
		roster = roster_maker.make
		expect(roster.fighters[0].rank).to eq(0)
		expect(roster.fighters[1].rank).to eq(1)
		expect(roster.fighters[2].rank).to eq(2)		
	end	

	it 'should create a roster with 2 random first names' do
		roster_maker = RosterMaker.new(2, fnames.dup, lnames,nicknames)
		roster = roster_maker.make
		expect(fnames).to include(roster.fighters[0].fname)
		expect(fnames).to include(roster.fighters[1].fname)			
	end

	it 'should create a roster with 2 random last names' do
		roster_maker = RosterMaker.new(2, fnames.dup, lnames.dup,nicknames)
		roster = roster_maker.make
		expect(lnames).to include(roster.fighters[0].lname)
		expect(lnames).to include(roster.fighters[1].lname)			
	end

	it 'should create a roster with 2 random nicknames' do
		roster_maker = RosterMaker.new(2, fnames.dup, lnames.dup, nicknames.dup)
		roster = roster_maker.make
		expect(nicknames).to include(roster.fighters[0].nickname)
		expect(nicknames).to include(roster.fighters[1].nickname)			
	end

end