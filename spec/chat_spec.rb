require_relative '../lib/chat'

describe 'chat class' do 
	let(:unknown_lines)	{["We've never met","Don't know them"]}
	let(:won_lines)		{["I beat em", "They lost last time"]}
	let(:lost_lines)	{["They beat me", "I failed last time"]}
	let (:ratio_win_lines)	{["I'm confident I'll win as usual", "Odds are against them"]}
	let (:ratio_lose_lines)	{["They tend to beat me", "I'll cause an upset"]}
	let (:ratio_even_lines)	{["We're well-matched", "Difficult to choose between us"]}
	let(:dummy_chat)	{ 	{1 =>	{
									:never_met => unknown_lines, 
									:won_last => won_lines,
									:lost_last => lost_lines,
									:ratio_win => ratio_win_lines,
									:ratio_lose => ratio_lose_lines,
									:ratio_even => ratio_even_lines
									},
							2 => 	{
									:never_met => unknown_lines, 
									:won_last => won_lines,
									:lost_last => lost_lines,
									:ratio_win => ratio_win_lines,
									:ratio_lose => ratio_lose_lines,
									:ratio_even => ratio_even_lines									}	
							}

						}
	let(:conor)			{EnemyBuilder.new
							.set_personality(1)
							.set_memory({})
							.build}
	let(:jose)			{EnemyBuilder.new
							.set_personality(2)
							.set_memory({})
							.build}
	let(:player)		{Player.new}

	context 'initializing the chat class' do 
		it 'should take in and store dummy_chat' do 
			chat = Chat.new(dummy_chat)
			expect(chat.catalogue).to eq(dummy_chat)
		end
	end

	context 'when enemy is challenged and player is challenger' do 
		it 'should say "Weve never met"or "Dont know them" for an unknown challenger prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [0,0,nil]
			expect(unknown_lines).to include(chat.last_fight(conor,player)[0])
		end

		it 'should say "I beat em" or "They lost last time" when they last beat known challenger prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [1,0,true]
			expect(won_lines).to include(chat.last_fight(conor,player)[0])
		end

		it 'should say "They beat me" or "I failed last time" when they last lost to known challenger prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [0,1,false]
			expect(lost_lines).to include(chat.last_fight(conor,player)[0])
		end

		it 'should default to acknowledge unknown for an unknown challenger prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [0,0,nil]
			expect(unknown_lines).to include(chat.prefight(conor,player)[0])
		end

		it 'should default to acknowledge last result if it was a loss to a known opponent prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [0,1,false]
			expect(lost_lines).to include(chat.prefight(conor,player)[0])
		end

		it 'should default to acknowledge last result if it was a win against a known opponent prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [1,0,true]
			expect(won_lines).to include(chat.prefight(conor,player)[0])
		end
	end

	context 'when conor is challenged and jose is challenger' do
		it 'should say "Weve never met"or "Dont know them" when conor meeting jose for first time prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[jose] = [0,0,nil]
			expect(unknown_lines).to include(chat.last_fight(conor,jose)[0])
		end

		it 'should say "Weve never met" or "Dont know them" when jose meeting conor for first time prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[jose] = [0,0,nil]
			jose.memory[conor] = [0,0,nil]
			expect(unknown_lines).to include(chat.last_fight(conor,jose)[1])
		end
	end


end

