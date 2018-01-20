require_relative '../lib/roster'

describe 'Roster class' do 
	it 'should hold an array of enemies' do 
		chosen = [Enemy.new, Enemy.new]
		roster = Roster.new(chosen)
		expect(roster.fighters).to eq(chosen) 
	end
end