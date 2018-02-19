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


game_text = GameText.new
puts game_text.welcome

player_setup_done = false


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
roster.add_player(player)
puts "Roster created. Would you like to see your fellow fighters? Y/N"
puts roster.see

matchmaker = Matchmaker.new(roster, player)
matchmaker.choose
matchmaker.meet
puts matchmaker.announce

#puts chat.catalogue[1][:never_met]
puts "Press release from #{matchmaker.challenged.fname}: #{chat.last_fight(matchmaker.challenged,matchmaker.challenger)[0]}" 
fight = Fight.new(matchmaker.challenged, matchmaker.challenger)
puts "Challenged rank is: #{matchmaker.challenged.rank}"
puts "Fight outcome - challenged retains rank? Type true or false:"
post_fight = PostFight.new(fight.retain_rank(gets.chomp))
post_fight.level_up
puts "#{post_fight.winner.fname} rank is: #{post_fight.winner.rank}"
post_fight.amend_memories


puts "Post-fight press release from #{post_fight.winner.fname}: #{chat.postfight(post_fight.winner, post_fight.loser)[0]}" unless !post_fight.winner.is_a?(Enemy)
puts "Post-fight press release from #{post_fight.loser.fname}: #{chat.postfight(post_fight.winner, post_fight.loser)[0]}" unless !post_fight.loser.is_a?(Enemy)


