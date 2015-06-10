require 'rubygems'
require 'json' #parsing JSON with Ruby


# http://www.rubydoc.info/gems/google-translate/1.1.2

# string = ["delhi", "chennai", "mumbai", "kolkata"]
# result = string.join(",")

string = File.read('delhi-stations.json')
parsed = JSON.parse(string)

stations = parsed["elements"]

station_names = []

stations.each{|station|
	name = station["tags"]["name"]
	if name == nil
		p station["id"]
	else
		station_names << name	
	end	
}

result = station_names.join(",")
p result