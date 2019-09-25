require "rubygems"
require "watir"

# some examples on waiting
# sometimes an element might not be on the screen yet so we have to wait a bit before trying
# to interact with it. 

# low tech version: sleep for a set number of seconds
# this isn't as good an approach though because it'll either be too much time or not enough. 
# you'll either end up wasting valuable time (and it adds up after awhile if you do this everywhere) 
# or you'll find yourself bumping the number up and actually masking performance errors. 
# try to avoid sleeping for a set amount. 

sleep 5
$browser.element(:xpath => "//span[text() = 'Message']").click

# next method: wait until it's present 
# this is much cleaner. there's a built in timeout of 30 seconds if something never shows up so that
# you're not waiting forever. 

$browser.element(:xpath => "//span[text() = 'Message']").wait_until_present
$browser.element(:xpath => "//span[text() = 'Message']").click

# you can also chain operations together and have fewer lines of code:

$browser.element(:xpath => "//span[text() = 'Message']").wait_until_present.click
