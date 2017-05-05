require 'rubygems'
require 'axlsx'

p = Axlsx::Package.new
wb = p.workbook

wb.styles do |s|
  head = s.add_style :bg_color => "00", :fg_color => "FF", :alignment => { :horizontal=> :center }
  wb.add_worksheet(:name => "RO_src") do |sheet|
    sheet.add_row ["path", "ident", "str_zh"]
    sheet.row_style 0, head
    Dir.glob("**/**/*.csv").each do |file|
      filename = File.basename(file)
      filepath = File.dirname(file)
      excel_file = File.join(filepath, filename)
      puts excel_file
      File.open(file, encoding: "UTF-8") do |f|
        f.each_line do |str|
          str.gsub!(/"[^"]*,[^"]*"/) { |match| match.gsub!(',', '[COMMA]') }
          fields = str.split(",", 3).map(&:strip)
          fields.map { |s| s.gsub!(/"([^"]+)"/, '\1') }
          fields.map! { |e| e.gsub("[COMMA]", ",") }
          sheet.add_row [fields[0], fields[1], fields[2]]
          sheet.column_widths 50, 50, 50
        end
      end
    end
  end
end

p.serialize("RO_src_file.xlsx")
