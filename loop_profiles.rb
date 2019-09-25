require "rubygems"

# loop through lines in a file
File.open("support/profiles.txt", "r").each_line do |profile|
	puts profile
end
