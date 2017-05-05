Dir['*.py_zh'].each do |file|
  File.open(file) do |f|
    f.each_line do |str|
      content = str.split(/(^.+)( = ('|"))(.*)(("|') #)(.*)/)
      puts content[7]
    end
  end
end
