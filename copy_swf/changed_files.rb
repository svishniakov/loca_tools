class File
  def self.update(src, dst)
    if File.exist? dst
      # skip if src file modification or creation time is same or earlier than target
      return if [File.ctime(src), File.mtime(src)].max <= [File.ctime(dst), File.mtime(dst)].max
    else
      # create target folder if not present
      FileUtils.mkdir_p(File.dirname(dst)) unless File.exist? File.dirname(dst)
    end
    FileUtils.cp(src, dst)
    puts src
  rescue => e
    puts "#{e}\n#{e.backtrace}"
  end
end

File.update source_file, target_file
