require_relative './game_text'
require_relative './player'
require_relative'./player_builder'
require_relative './file_parser'
require_relative './roster_maker'
require_relative './enemy_builder'
require_relative './enemy'
require_relative './roster'
require_relative './matchmaker'
require 'spreadsheet'

fnames = File.read('../assets/enemy_first_names.txt')
lnames = File.read('../assets/enemy_last_names.txt')
nicknames = File.read('../assets/enemy_nicknames.txt')
spreadsheet = File.open('../assets/punchout_characters_v2.xls')
file_parser = FileParser.new(fnames,lnames,nicknames,spreadsheet)

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
matchmaker.announce




