require_relative '../lib/roster'

describe 'Roster class' do 
	it 'should hold an array of enemies' do 
		chosen = [Enemy.new, Enemy.new]
		roster = Roster.new(chosen)
		expect(roster.fighters).to eq(chosen) 
	end

	it 'should add player' do 
		chosen = [Enemy.new, Enemy.new]
		roster = Roster.new(chosen)
		player = Player.new
		roster.add(player)
		expect(roster.fighters).to include(player) 
	end	
end