require_relative './game_text'
require_relative './player'
require_relative'./player_builder'
require_relative './file_parser'
require_relative './roster_maker'
require_relative './enemy_builder'
require_relative './enemy'
require_relative './roster'
require_relative './matchmaker'
require_relative './chat'
require_relative './fight'
require_relative './post_fight'
require 'spreadsheet'

fnames = File.read('../assets/enemy_first_names.txt')
lnames = File.read('../assets/enemy_last_names.txt')
nicknames = File.read('../assets/enemy_nicknames.txt')
spreadsheet = File.open('../assets/punchout_characters_v2.xls')
file_parser = FileParser.new(fnames,lnames,nicknames,spreadsheet)
chat = Chat.new(file_parser.catalogue)

roster_size = 4
roster = RosterMaker.new(	roster_size,
							file_parser.enemy_fnames,
							file_parser.enemy_lnames,
							file_parser.enemy_nicknames).make


system('cls')
game_text = GameText.new
puts game_text.welcome
puts ""
puts "Press Enter to continue:"
loop do 
	break if gets.chomp == ""
end
system('cls')

puts game_text.ask_fname
fname = "Shen"
puts game_text.ask_lname
lname = "Sat"
puts game_text.ask_nickname
nickname = "Sleep"
puts game_text.ask_rank
rank = "10"
player = PlayerBuilder.new.set_fname(fname).set_lname(lname).set_nickname(nickname).set_rank(rank).build


puts "A new fighter enters the stage: #{player.fname} #{player.nickname} #{player.lname}, with a rank of #{player.rank}!"
puts ""
puts "Press Enter to continue"
loop do 
	break if gets.chomp == ""
end
system('cls')

roster.add_player(player)

loop do 
	puts "Would you like to see the fighters roster? Y/N"
	roster_answer = ""
	loop do 
		roster_answer = gets.chomp
		break if roster_answer =="y" || roster_answer =="n"
	end
	if roster_answer == "y"
		puts roster.see
		puts "Press Enter to continue:"
		loop do 
			break if gets.chomp == ""
		end
	end

	system('cls')

	matchmaker = Matchmaker.new(roster, player)
	matchmaker.choose
	matchmaker.meet
	puts matchmaker.announce

	puts "Press release from #{matchmaker.challenged.fname}: " + '"' + "#{chat.last_fight(matchmaker.challenged,matchmaker.challenger)[0]}" + '"'
	puts ""
	puts "Press Enter to continue"

	loop do 
		break if gets.chomp == ""
	end
	system('cls')


	fight = Fight.new(matchmaker.challenged, matchmaker.challenger)
	puts "[This is a fight placeholder] Does player win fight? Type Y/N:"
	fight_answer = ""
	loop do 
		fight_answer = gets.chomp
		break if fight_answer == "y" || fight_answer == "n"
	end
	system('cls')
	fight_answer == "y" ? fight_answer = "false" : fight_answer = "true"
	post_fight = PostFight.new(fight.retain_rank(fight_answer))
	post_fight.level_up
	post_fight.amend_memories
	puts "#{post_fight.winner.fname} #{post_fight.winner.nickname} #{post_fight.winner.lname} wins!"
	puts "Post-fight press release from #{post_fight.winner.fname}: " + '"' + "#{chat.postfight(post_fight.winner, post_fight.loser)[0]}" + '"' unless !post_fight.winner.is_a?(Enemy)
	puts "Post-fight press release from #{post_fight.loser.fname}: " + '"' + "#{chat.postfight(post_fight.winner, post_fight.loser)[0]}" + '"' unless !post_fight.loser.is_a?(Enemy)
	puts ""
	puts "Press Enter to continue:"
	loop do 
		break if gets.chomp == ""
	end
	system('cls')
end




