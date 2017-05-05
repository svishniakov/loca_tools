require 'fileutils'

# read all the CSV files from folder
Dir['*.csv'].each do |file|
  File.open(file) do |f|
    # iterate each line of the file
    f.each_line do |str|
      # path extract from string
      fields = str.split(",",3).map(&:strip)
      # split path to dirs and filename
      path_dirs = fields[0].split("\\")
      # full path without file
      dir = File.join(path_dirs[0...-1])
      # create full dirs structure based on [dirs] variable
      FileUtils.mkdir_p(dir)
      # create CSV file
      csv_file = File.new(File.join(dir, "#{path_dirs.last}.csv"), "a", encoding: "UTF-8")
      # add string to the file + line ending correctness
      csv_file.write "#{str.gsub! "\n", "\r\n"}"
    end
  end
end
