require_relative '../lib/file_loader'

describe 'File Loader class' do 
	let(:my_file)	{File.open("../assets/enemy_first_names.txt")}

	it 'should load an enemy fnames text file' do 
		file_loader = FileLoader.new
		file_loader.enemy_fnames_list = my_file
	end
end
