require "rubygems"
require "watir"
require "json"

# collect the login info - email and password for linkedin account
login_info = JSON.parse(File.read("support/login_FRITZ.json"))

# set up a browser object--need the path to chromedriver, then set up the driver, then use it to 
# bring up the browser
chromedriver_path = File.join(File.absolute_path("webdriver/", File.dirname(__FILE__)),"chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$browser = Watir::Browser.new :chrome

# go go gadget make it bigger
$browser.driver.manage.window.maximize

# navigate to a site--linkedin.com. let's go directly to the login page
$browser.goto("linkedin.com/login")

# next we enter a username and password. this is taken from the login info further up
$browser.text_field(id: "username").set(login_info["username"])
$browser.text_field(id: "password").set(login_info["password"])

# then click the button to log in
$browser.element(tag_name: "form", class: "login__form").button(type:"submit" ).click

# sleep for a few seconds
sleep 5

# next let's go directly to someone's profile url
$browser.goto("https://www.linkedin.com/in/elisabeth-laspe-86aa499b/")

# click on the message button
$browser.element(:xpath => "//span[text() = 'Message']").wait_until_present.click

# hit the enter key just in case it doesn't actually click the button to bring up the message box
$browser.send_keys(:enter)

# wait for the message box to come up
$browser.element(:xpath => "//h4[text() = 'New message']").wait_until_present

# sleep a bit to make sure the cursor is in the text field
sleep 3

# when the message box pops up, the cursor will automatically be focused. 
# we can use "send_keys" to type the message into the box
$browser.send_keys("Hey Liz lol we're using your profile for the automation! Hope your weekend went good :)")

# when done, send ctrl-enter as a "key chord" to send the message
$browser.send_keys([:control, :enter])

# wait a few seconds to enjoy the fruits of our labor!
sleep 5

# done! yay! 