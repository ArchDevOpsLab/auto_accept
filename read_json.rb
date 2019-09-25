require "rubygems"
require "json"

# collect the login info - email and password for linkedin account
json_data = JSON.parse(File.read("support/login.json"))

puts json_data['username']