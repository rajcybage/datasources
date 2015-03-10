require 'roo'
class CsvImport < ActiveRecord::Base
	#include WithoutTimestamps

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (1..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      csv_import = new
      csv_import.csv_values = row.to_hash
      csv_import.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def save_without_timestamps
    without_timestamps do
      save!
    end
  end

end
