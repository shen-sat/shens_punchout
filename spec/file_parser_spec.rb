require_relative '../lib/file_parser'
require 'spec_helper'
File.open('C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/spreadsheet-1.1.5/lib/spreadsheet.rb')

describe 'File Loader class' do 
	#let(:enemy_fnames_txt)	{File.read("#{RSPEC_ROOT}/../assets/enemy_first_names.txt")}
	#let(:enemy_lnames_txt)	{File.read("#{RSPEC_ROOT}/../assets/enemy_last_names.txt")}
	#let(:enemy_nicknames_txt)	{File.read("#{RSPEC_ROOT}/../assets/enemy_nicknames.txt")}
	let(:sample_fnames)	{"Max\nConor\nJose"}
	let(:sample_lnames)	{"Holloway\nMcgregor\nAldo"}
	let(:sample_nicknames)	{'"Blessed"' + "\n" '"The Notorious"' + "\n" + '"Junior"'}
	let(:mock_spreadsheet)	{File.open('#{RSPEC_ROOT}/../mocks/mock_spreadsheet.xls')}


	
	it 'should take in fnames list and return fnames array' do 
		file_parser = FileParser.new(sample_fnames, sample_lnames, sample_nicknames)
		expect(file_parser.enemy_fnames).to eq(["Max", "Conor", "Jose"])
	end

	it 'should take in lnames list and return lnames array' do 
		file_parser = FileParser.new(sample_fnames, sample_lnames, sample_nicknames)
		expect(file_parser.enemy_lnames).to eq(["Holloway", "Mcgregor", "Aldo"])
	end

	it 'should take in nicknames list and return nicknames array' do 
		file_parser = FileParser.new(sample_fnames, sample_lnames, sample_nicknames)
		expect(file_parser.enemy_nicknames).to eq(['"Blessed"', '"The Notorious"', '"Junior"'])
	end

	it 'should take in spreadsheet and return a dialogue hash' do 
		file_parser = FileParser.new(sample_fnames, sample_lnames, sample_nicknames, mock_spreadsheet)
		expect(file_parser.catalogue).to eq({
			:char_1 => { 	:never_met => ["We have never met", "They are unknown"], 
							:won_last => ["They beat me last", "I lost last time"]},
			:char_2 => { 	:never_met => ["We have never bloody met", "They are bloody unknown"], 
							:won_last => ["They bloody beat me last", "I bloody lost last time"]} 
			})
	end

=begin

	it 'should read and store enemy fnames' do 
		file_parser = FileParser.new
		expect(file_parser.enemy_fnames).to eq(enemy_fnames_txt)
	end

	it 'should read and store enemy lnames' do 
		file_parser = FileParser.new
		expect(file_parser.enemy_lnames).to eq(enemy_lnames_txt)
	end

	it 'should read and store enemy nicknames' do 
		file_parser = FileParser.new
		expect(file_parser.enemy_nicknames).to eq(enemy_nicknames_txt)
	end

=end

end

