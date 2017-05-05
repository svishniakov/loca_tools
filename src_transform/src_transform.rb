Dir.glob("**/**/*.csv").each do |file|
  File.open(file, encoding: "gbk") do |f|
    new_file = File.new("#{File.dirname(file)}/#{File.basename(file, ".*")}_conv.csv", "w", encoding: "UTF-8")
    f.each_line do |str|
      string = str.encode("UTF-8")
      new_file.puts(string)
    end
  end
end
