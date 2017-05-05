require 'rubygems'
require 'faker'

new_file = File.new("names.txt", "w", encoding: "UTF-8")
1000.times do
  title = Faker::Name.prefix
  name = Faker::Name.name
  author = Faker::Book.author
  team_name = Faker::Team.name
  new_file.puts("| #{team_name} |")
end
