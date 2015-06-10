require 'rubygems'
require 'json'

string = File.read('stations.json')
parsed = JSON.parse(string)

cities = parsed["stations"]

cities.each{|city|
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