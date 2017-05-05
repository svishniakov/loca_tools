require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'active_support'
require 'active_support/core_ext'

START_URL = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
BASE_URL = "http://www.languagedaily.com/"

URL = Nokogiri::HTML(open("#{START_URL}"))

URL.xpath(".//*[@id='jsn-mainbody']/div[2]/div/div[1]/ul/li/a").each do |link|
  PAGE_URL = link['href']

  entries = URL.xpath('//tr[contains(@class, "rowA") or contains(@class, "rowB")]')
  entries.each do |td|
    no = td.css('td')[0].text.strip
    src = td.css('td')[1].text.strip
    trans = td.css('td')[2].text.strip
    if trans.present?
      puts "#{no} | #{src} | #{trans} |"
    end
  end
  URL = Nokogiri::HTML(open("#{BASE_URL}#{PAGE_URL}"))
end









