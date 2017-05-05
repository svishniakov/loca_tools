require 'rubygems'
require 'creek'

workbook =  Creek::Book.new "RO_src_file.xlsx"

worksheet = workbook.sheets[0]

worksheet.rows.each do |row|
  keys = row.keys
  puts row[keys[0]]
end
