require 'nokogiri'

doc = Nokogiri::XML(File.open("fla_chinese.xml"))

# p doc.encoding.name

doc.xpath('//content').each do |node_set|
  key = node_set.at_xpath('key')
  value = node_set.at_xpath('value')
  value.content = key.content.encode('utf-8')

  puts key.text + " - " + value.text

  File.write("fla_chinese_modified.xml", doc.to_xml)
end
