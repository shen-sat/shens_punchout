require_relative '../lib/file_parser'
require 'spec_helper'

describe 'File Loader class' do 
	#let(:enemy_fnames_txt)	{File.read("#{RSPEC_ROOT}/../assets/enemy_first_names.txt")}
	#let(:enemy_lnames_txt)	{File.read("#{RSPEC_ROOT}/../assets/enemy_last_names.txt")}
	#let(:enemy_nicknames_txt)	{File.read("#{RSPEC_ROOT}/../assets/enemy_nicknames.txt")}
	let(:sample_fnames)	{"Max\nConor\nJose"}
	let(:sample_lnames)	{"Holloway\nMcgregor\nAldo"}
	let(:sample_nicknames)	{'"Blessed"' + "\n" '"The Notorious"' + "\n" + '"Junior"'}


	
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

