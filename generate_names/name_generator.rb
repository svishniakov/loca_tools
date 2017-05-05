require 'rubygems'
require 'name-generator'

new_file = File.new("names.txt", "w", encoding: "UTF-8")


generator = NameGenerator::Main.new
# puts generator.next_name
# => "Foonqtar"

10000.times { new_file.puts("#{generator.next_name} #{generator.next_name}") }
