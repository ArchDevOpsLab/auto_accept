require "rubygems"
require "json"

# loop through items in a json file
file = File.open "./support/profiles.json"
profile_data = JSON.load file

profile_data.each do |person, url|
	puts "Person's name is #{person}"
	puts "Profile URL is #{url}"
end