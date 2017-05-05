require 'rubygems'
require 'creek'
require 'csv'

filename = "SRC_converted.csv"

CSV.open(filename, 'w') do |csv|
  puts "*** Excel files parsed ***"

  Dir.glob("*.xlsx").each do |file|
    puts file

    workbook =  Creek::Book.new file
    worksheet = workbook.sheets[0]

    worksheet.rows.each do |row|
      keys = row.keys
      csv << [row[keys[0]], row[keys[1]], row[keys[2]]] unless row[keys[2]].nil?
    end
  end

  File.new(filename)
  puts "*** Output file generate ***"
  puts filename
end
