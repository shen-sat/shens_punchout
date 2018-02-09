require_relative '../lib/post_fight'

describe 'PostFight class' do 
let(:conor) 	{EnemyBuilder.new
					.set_fname("Conor")
					.set_lname("McGregor")
					.set_nickname("'The Notorious'")
					.set_rank(1)
					.set_memory({})
					.build}

	it 'should take and store Conor as winner and Jose as loser' do 
		#post_fight = PostFight.new()
	end

end