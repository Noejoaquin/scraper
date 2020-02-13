#get html from espn
#parse that shiz
#use nokogiri for html parsing
# parse for links/ titles of articles
require 'nokogiri'
require 'open-uri'
def scrape
  doc = Nokogiri::HTML(open("https://www.espn.com/"))
  a = doc.css("section[id=\"news-feed\"] > section > section > a")
  a.map do |link|
    hash = {}
    h1 = link.css("h1")
    text = h1.children.first&.text
    hash[:h1] = text
    hash[:href] = link["href"]
    hash
  end
end

# a = doc.xpath("//section[@id=\"news-feed\"]/section/section/a")
# a.map { |link| link.css("h1") } #get h1s
# //section[@id="news-feed"]/section/section/a
puts scrape
