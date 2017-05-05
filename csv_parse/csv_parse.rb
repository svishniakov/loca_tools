Dir['*.csv'].each do |file|
  File.open(file) do |f|
    new_file = File.open("#{File.basename(file, ".csv")}_conv" + File.extname(file), "w")
    f.each_line do |str|
      str.gsub!(/"[^"]*,[^"]*"/) { |match| match.gsub!(',', '[COMMA]') }
      fields = str.split(",", 3).map(&:strip)
        fields[2].gsub!(/"([^"]+)"/, '\1')
        fields.map! { |e| e.gsub("[COMMA]", ",") }
        fields[2] = "\"#{fields[2]}\"" unless fields[2] =~ /^".*"$/
        str = fields.join(",")
        new_file.puts(str)
        fields = nil
    end
  end
end
