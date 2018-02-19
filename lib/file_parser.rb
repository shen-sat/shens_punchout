class FileParser
	attr_reader :enemy_fnames, :enemy_lnames, :enemy_nicknames, :catalogue
	

	def initialize(enemy_fnames, enemy_lnames, enemy_nicknames, spreadsheet)
		@enemy_fnames = enemy_fnames.split("\n").to_a
		@enemy_lnames = enemy_lnames.split("\n").to_a
		@enemy_nicknames = enemy_nicknames.split("\n").to_a
		@catalogue = parse_spreadsheet(spreadsheet)	
	end

	def parse_spreadsheet(spreadsheet)
		book = Spreadsheet.open spreadsheet
		catalogue = {}
		book.worksheets.each do |sheet|
			catalogue[sheet.name.to_i] = {}
			sheet.each do |row|
				catalogue[sheet.name.to_i][row[0].to_sym] = [] unless row[0].nil?
				row.each do |cell|
					catalogue[sheet.name.to_i][row[0].to_sym].push(cell) unless (cell.nil? || cell == row[0])
				end
			end
		end
		return catalogue
	end

end
