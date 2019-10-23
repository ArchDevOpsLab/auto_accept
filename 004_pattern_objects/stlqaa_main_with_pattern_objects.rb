# this one uses a new thing called a pattern object, not a page object
Dir["./classes/*.rb"].each {|file| require file }
Dir["./pattern_objects/*.rb"].each {|file| require file }

# these could be put into another file but let's show them here so we can follow it easier.
# Browser.new has an initialize method that automatically gets called. what's it do? 
Browser.new("www.linkedin.com/login")

# this Login class uses pattern objects now.
Login.new

# navigate to url for person's profile.
Navigate.new(Profiles.new("Elisabeth Laspe").profile)

sleep 3

# send them a message. Messaging.new calls initialize and it has the logic in there to call
# all the other methods inside there. 
# the Messaging class now uses Pattern Object for locators
Messaging.new("Example of using pattern objects to send a message. Thanks for coming!")
