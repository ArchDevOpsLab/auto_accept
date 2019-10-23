# pull in all classes AND page objects this time. 
Dir["./classes/*.rb"].each {|file| require file }
Dir["./page_objects/*.rb"].each {|file| require file }

# these could be put into another file but let's show them here so we can follow it easier.
# Browser.new has an initialize method that automatically gets called. what's it do? 
Browser.new("www.linkedin.com/login")

# this Login class uses page objects now.
Login.new

# navigate to url for person's profile.
Navigate.new(Profiles.new("Elisabeth Laspe").profile)

sleep 3

# send them a message. Messaging.new calls initialize and it has the logic in there to call
# all the other methods inside there. 
# the Messaging class now uses the ProfilePage page object for locators
Messaging.new("Example of using Page Objects to send a message")
