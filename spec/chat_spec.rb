require_relative '../lib/chat'

describe 'chat class' do 
	let(:unknown_lines)	{["We've never met","Don't know them"]}
	let(:won_lines)		{["I beat em", "They lost last time"]}
	let(:lost_lines)	{["They beat me", "I failed last time"]}
	let (:ratio_win_lines)	{["I'm confident I'll win as usual", "Odds are against them"]}
	let (:ratio_lose_lines)	{["They tend to beat me", "I'll cause an upset"]}
	let (:ratio_even_lines)	{["We're well-matched", "Difficult to choose between us"]}
	let(:dummy_chat)	{ {1 =>	{ 	:never_met => unknown_lines, 
									:won_last => won_lines,
									:lost_last => lost_lines,
									:ratio_win => ratio_win_lines,
									:ratio_lose => ratio_lose_lines,
									:ratio_even => ratio_even_lines
						}}}
	let(:conor)			{EnemyBuilder.new
							.set_personality(1)
							.set_memory({})
							.build}
	let(:player)		{Player.new}

	it 'should take in and store dummy_chat' do 
		chat = Chat.new(dummy_chat)
		expect(chat.catalogue).to eq(dummy_chat)
	end

	it 'should say "Weve never met"or "Dont know them" for an unknown challenger' do 
		chat = Chat.new(dummy_chat)
		expect(unknown_lines).to include(chat.last_fight(conor,player))
	end

	it 'should say "I beat em" or "They lost last time" after beating a challenger' do 
		chat = Chat.new(dummy_chat)
		conor.memory[player] = [1,0,true]
		expect(won_lines).to include(chat.last_fight(conor,player))
	end

	it 'should say "They beat me" or "I failed last time" after losing to a challenger' do 
		chat = Chat.new(dummy_chat)
		conor.memory[player] = [0,1,false]
		expect(lost_lines).to include(chat.last_fight(conor,player))
	end

	it 'should default to acknowledge unknown for an unknown challenger' do 
		chat = Chat.new(dummy_chat)
		conor.memory[player] = [0,0,nil]
		expect(unknown_lines).to include(chat.prefight(conor,player))
	end

	
=begin
#---For when doing ratio chats---
	it 'should acknowledge when ratio 0.7 in favour of conor' do 
		chat = Chat.new(dummy_chat)
		conor.memory[player] = [7,3,false]
		expect(ratio_win_lines).to include(chat.fight_ratio(conor,player))
	end

	it 'should acknowledge when ratio 0.7 in favour of player' do 
		chat = Chat.new(dummy_chat)
		conor.memory[player] = [3,7,false]
		expect(ratio_lose_lines).to include(chat.fight_ratio(conor,player))
	end
=end


end

