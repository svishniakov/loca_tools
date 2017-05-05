require 'rubygems'
require 'axlsx'

Dir.glob("**/**/*.csv").each do |file|
  filename = File.basename(file)
  filepath = File.dirname(file)
  excel_file = File.join(filepath, filename)
  File.open(file, encoding: "UTF-8") do |f|
    p = Axlsx::Package.new
    wb = p.workbook

    puts excel_file

    wb.styles do |s|
      # head = s.add_style :bg_color => "00", :fg_color => "FF", :alignment => { :horizontal=> :center }
      # wb.add_worksheet(:name => "#{filename[0..30]}") do |sheet|
      wb.add_worksheet(:name => "Sheet1") do |sheet|
        sheet.add_row ["path", "ident", "str_en"]
        # sheet.row_style 0, head
        f.each_line do |str|
          str.gsub!(/"[^"]*,[^"]*"/) { |match| match.gsub!(',', '[COMMA]') }
          fields = str.split(",", 3).map(&:strip)
          fields.map { |s| s.gsub!(/"([^"]+)"/, '\1') }
          fields.map! { |e| e.gsub("[COMMA]", ",") }
          sheet.add_row [fields[0], fields[1], fields[2]]
        end
      end
    end
    p.serialize("#{excel_file}.xlsx")
  end
end
