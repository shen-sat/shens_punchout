require_relative '../lib/roster_maker'

describe 'Roster Maker class' do 

	it 'should create a roster with 5 opponents' do 
		roster_maker = RosterMaker.new(5)
		expect(roster_maker.make.fighters.length).to eq(5)
	end
	it 'should create a roster with 3 ranked opponents, 0-2' do 
		roster_maker = RosterMaker.new(3)
		roster = roster_maker.make
		expect(roster.fighters[0].rank).to eq(0)
		expect(roster.fighters[1].rank).to eq(1)
		expect(roster.fighters[2].rank).to eq(2)		
	end	

end