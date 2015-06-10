require 'rubygems'
require 'mechanize' #automating interaction with websites
require 'nokogiri' #HTML, XML, SAX, and Reader parser. Among Nokogiri's many features is the ability to search documents via XPath or CSS3 selectors
require 'open-uri' #easy-to-use wrapper for Net::HTTP, Net::HTTPS and Net::FTP
require 'json' #parsing JSON with Ruby

# 1
# -----------
# agent = Mechanize.new

# page = agent.get('http://google.com/')

# page.links.each do |link|
#   puts link.text
# end

# 2
# -----------

string = File.read('stations.json')
parsed = JSON.parse(string)

# states = parsed["states"]

# states.each{|state|
# 	p state["name"]
# }

cities = parsed["stations"]

cities.each{|city|
	# p station["stateID"]
	stations = city["stationsInCity"]
	stations.each{|station|
		live = station["live"]
		if live == true
			id = station["id"]
			p "#{id}" + ", " + "#{live}"
			(1...13).each { |date|
				p "http://aqi.iitk.ac.in:9000/metrics/station/#{id}?d=#{date}%2F04%2F2015&h=23"
			}
		end
		
	}
}

