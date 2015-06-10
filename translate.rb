require 'rubygems'
require 'json' #parsing JSON with Ruby


# http://www.rubydoc.info/gems/google-translate/1.1.2

# string = ["delhi", "chennai", "mumbai", "kolkata"]
# result = string.join(",")

string = File.read('delhi-city.json')
parsed = JSON.parse(string)

cities = parsed["elements"]

city_names = []

cities.each{|city|
	name = city["tags"]["name"]
	if name == nil
		p ""
	else
		city_names << name	
	end	
}

# p city_names
result = city_names.join(",")
p result