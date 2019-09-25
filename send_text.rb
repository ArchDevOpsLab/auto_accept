require "rubygems"
require "watir"

# there are a couple ways to enter text: 
# - "set" it
# - type it in using send_keys

# if you want to just set the text in a textbox to a particular string, you can do it like this: 
$browser.text_field(:xpath => "//input[@tag='my_cool_text_box"]).set("This is the string to set to")

# note that we use a text_field here, not an element. 
# that's important. 
# you can't "set" text in an element that's not a text_field. watir will yell at you. 

# but we can send_keys into practically anything. plus we can send special characters a little easier. 
$browser.element(:xpath => "//input[@tag='my_cool_text_box"]).click
# note this is an element. it could also have been treated as a text_field but
# this is to demonstrate that we're clicking on "some element", not necessarily a text_field. 
# you can click on anything. 
# if this is supposed to behave like a text box then a cursor will probably show up. 
# from there you can type data in like this: 
$browser.send_keys("This is the string we want to type")

# we can also send special characters like this: 
$browser.send_keys(:enter)

# or particular key combinations. here's an example of ctrl-enter: 
$browser.send_keys([:control, :enter])

# notice how this is inside of [square brackets]. 
# this needs to be done if you want to simulate hitting multiple keys at a time
# like key combos or hotkeys. 
