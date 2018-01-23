require_relative '../lib/file_parser'

describe 'File Loader class' do 
	let(:enemy_fnames_txt)	{File.read("C:/Users/Shen/Desktop/Workspace/shens_punchout/assets/enemy_first_names.txt")}
	let(:enemy_lnames_txt)	{File.read("C:/Users/Shen/Desktop/Workspace/shens_punchout/assets/enemy_last_names.txt")}
	let(:enemy_nicknames_txt)	{File.read("C:/Users/Shen/Desktop/Workspace/shens_punchout/assets/enemy_nicknames.txt")}


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
end

