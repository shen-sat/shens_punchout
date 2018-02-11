require_relative '../lib/chat'

describe 'chat class' do 
	let(:unknown_lines)		{["We've never met","Don't know them"]}
	let(:won_lines)			{["I beat em", "They lost last time"]}
	let(:lost_lines)		{["They beat me", "I failed last time"]}
	let(:post_win_lines)	{["I knew I'd beat em", "I'm not suprised"]}
	let(:post_loss_lines)	{["I can't beleive it", "I dunno what happened"]}
	let(:unknown_lines_j)	{["Never met this amigo","Don't know this amigo"]}
	let(:won_lines_j)		{["I beat amigo", "Amigo lost last time"]}
	let(:lost_lines_j)		{["Amigo beat me", "I lost last time"]}
	let(:post_win_lines_j)	{["I knew I'd beat amigo", "I'm not surprised amigo"]}
	let(:post_loss_lines_j)	{["I can't believe it amigo", "I dunno what happened amigo"]}
	let(:dummy_chat)		{ 	{1 =>	{
										:never_met => unknown_lines, 
										:won_last => won_lines,
										:lost_last => lost_lines,
										:post_win => post_win_lines,
										:post_loss => post_loss_lines
										},
								2 => 	{
										:never_met => unknown_lines_j, 
										:won_last => won_lines_j,
										:lost_last => lost_lines_j,
										:post_win => post_win_lines_j,
										:post_loss => post_loss_lines_j								}	
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

	context 'when enemy is challenged and player is challenger prefight' do 
		it 'conor should say "Weve never met" or "Dont know them" for an unknown player' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [0,0,nil]
			expect(unknown_lines).to include(chat.last_fight(conor,player)[0])
		end

		it 'conor should say "I beat em" or "They lost last time" when they last beat known player' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [1,0,true]
			expect(won_lines).to include(chat.last_fight(conor,player)[0])
		end

		it 'conor should say "They beat me" or "I failed last time" when they last lost to known player' do 
			chat = Chat.new(dummy_chat)
			conor.memory[player] = [0,1,false]
			expect(lost_lines).to include(chat.last_fight(conor,player)[0])
		end


	end

	context 'when conor is challenged and jose is challenger prefight' do
		it 'conor should say "Weve never met"or "Dont know them" when meeting jose for first time prefight' do 
			chat = Chat.new(dummy_chat)
			conor.memory[jose] = [0,0,nil]
			jose.memory[conor] = [0,0,nil]
			expect(unknown_lines).to include(chat.last_fight(conor,jose)[0])
		end

		it 'jose should say "Never met this amigo" or "Dont know this amigo" when meeting conor for first time' do 
			chat = Chat.new(dummy_chat)
			conor.memory[jose] = [0,0,nil]
			jose.memory[conor] = [0,0,nil]
			expect(unknown_lines_j).to include(chat.last_fight(conor,jose)[1])
		end

		it 'jose should say "I beat amigo" or "Amigo lost last time" if he beat conor last fight and conor should say vice versa' do 
			chat = Chat.new(dummy_chat)
			conor.memory[jose] = [0,1,false]
			jose.memory[conor] = [1,0,true]
			expect(won_lines_j).to include(chat.last_fight(conor,jose)[1])
			expect(lost_lines).to include(chat.last_fight(conor,jose)[0])
		end

		it 'jose should say "Amigo beat me" or "I lost last time" if he lost to conor last fight and conor should say vice versa' do 
			chat = Chat.new(dummy_chat)
			conor.memory[jose] = [1,0,true]
			jose.memory[conor] = [0,1,false]
			expect(lost_lines_j).to include(chat.last_fight(conor,jose)[1])
			expect(won_lines).to include(chat.last_fight(conor,jose)[0])
		end
	end

	context 'after conor fights jose postfight' do 
		it 'conor should say he won if he beat jose' do 
			chat = Chat.new(dummy_chat)
			expect(post_win_lines).to include(chat.postfight(conor,jose)[0])
		end
	end


end

