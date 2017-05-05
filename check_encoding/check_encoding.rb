Dir['*_20160825.csv'].each do |file|
  File.open(file) do |f|
    new_file = File.open("#{File.basename(file, ".csv")}_conv" + File.extname(file), "w")
    f.each_line do |str|
      string = str.encode("UTF-8")
      new_file.puts(string)
    end
  end
end
