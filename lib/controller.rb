require_relative './game_text'
require_relative './player'
require_relative'./player_builder'
require_relative './file_parser'
require 'spreadsheet'

fnames = File.read('../assets/enemy_first_names.txt')
lnames = File.read('../assets/enemy_last_names.txt')
nicknames = File.read('../assets/enemy_nicknames.txt')
spreadsheet = File.open('../mocks/mock_spreadsheet.xls')
file_parser = FileParser.new(fnames,lnames,nicknames,spreadsheet)

game_text = GameText.new
puts game_text.welcome

player_setup_done = false


puts game_text.ask_fname
fname = gets.chomp
puts game_text.ask_lname
lname = gets.chomp
puts game_text.ask_nickname
nickname = gets.chomp
puts game_text.ask_rank
rank = gets.chomp
player = PlayerBuilder.new.set_fname(fname).set_lname(lname).set_nickname(nickname).set_rank(rank).build

puts "A new fighter enters the stage: #{player.fname} #{player.nickname} #{player.lname}, with a rank of #{player.rank}!"


