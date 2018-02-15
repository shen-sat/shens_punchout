require_relative '../lib/post_fight'

describe 'PostFight class' do 
let(:conor) 	{EnemyBuilder.new
					.set_fname("Conor")
					.set_lname("McGregor")
					.set_nickname("'The Notorious'")
					.set_memory({})
					.build}
let(:max) 	{EnemyBuilder.new
					.set_fname("Max")
					.set_lname("Holloway")
					.set_nickname("'Blessed'")
					.set_memory({})
					.build}
let(:player)	{Player.new}
	
	context 'when player is one of the fighters' do 
		it 'should take and store player as winner and conor as loser' do 
			post_fight = PostFight.new([player, conor])
			expect(post_fight.winner).to eq(player)
			expect(post_fight.loser).to eq(conor) 
		end

		it 'should swap ranks for a lower ranked player (winner) and higher ranked conor (loser)' do 
			player.rank = 3
			conor.rank = 0
			post_fight = PostFight.new([player, conor])
			post_fight.level_up
			expect(player.rank).to eq(0)
			expect(conor.rank).to eq(3)
		end

		it 'should NOT swap ranks for a higher ranked player (winner) and lower ranked conor (loser)' do 
			player.rank = 1
			conor.rank = 5
			post_fight = PostFight.new([player, conor])
			post_fight.level_up
			expect(player.rank).to eq(1)
			expect(conor.rank).to eq(5)
		end

		it 'should amend conor memory to reflect loss to player' do
			conor.memory[player] = [0,0,nil]
			post_fight = PostFight.new([player, conor])
			post_fight.amend_memories
			expect(conor.memory[player]).to eq([0,1,false])
		end

		it 'should amend conor memory to reflect win over player' do
			conor.memory[player] = [1,2,false]
			post_fight = PostFight.new([conor,player])
			post_fight.amend_memories
			expect(conor.memory[player]).to eq([2,2,true])
		end
	end

	context 'when both fighters are enemies' do
		it 'should take and store conor as winner and max as loser' do 
			post_fight = PostFight.new([conor, max])
			expect(post_fight.winner).to eq(conor)
			expect(post_fight.loser).to eq(max) 
		end

		it 'should swap ranks for lower ranked max beating higher ranked conor' do 
			max.rank = 3
			conor.rank = 1
			post_fight = PostFight.new([max,conor])
			post_fight.level_up
			expect(max.rank).to eq(1)
			expect(conor.rank).to eq(3)
		end

		it 'should NOT swap ranks for higher ranked max beating lower ranked conor' do 
			max.rank = 1
			conor.rank = 3
			post_fight = PostFight.new([max,conor])
			post_fight.level_up
			expect(max.rank).to eq(1)
			expect(conor.rank).to eq(3)
		end

		it 'should amend conor memory to reflect loss to max' do
			conor.memory[max] = [0,0,nil]
			max.memory[conor] = [0,0,nil]
			post_fight = PostFight.new([max,conor])
			post_fight.amend_memories
			expect(conor.memory[max]).to eq([0,1,false])
		end

		it 'should amend conor memory to reflect win over max' do
			conor.memory[max] = [5,5,true]
			max.memory[conor] = [5,5,false]
			post_fight = PostFight.new([conor,max])
			post_fight.amend_memories
			expect(conor.memory[max]).to eq([6,5,true])
		end

	end 	
end