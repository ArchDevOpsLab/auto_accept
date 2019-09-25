require "rubygems"
require "watir"
require "json" 

chromedriver_path = File.join(File.absolute_path("webdriver/", File.dirname(__FILE__)),"chromedriver.exe")
puts chromedriver_path

Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$browser = Watir::Browser.new :chrome

$browser.goto("www.linkedin.com/login")
sleep 3

file = File.open "support/login_FRITZ.json"
data = JSON.load file

# samir's example: 
# $browser.text_field(name: 'email').set("hey@email.com")

$browser.text_field(:xpath => "//input[@id='username']").set(data['username'])
$browser.text_field(:xpath => "//input[@id='password']").set(data['password'])
$browser.button(:xpath => "//button[text()='Sign in']").click 

$browser.goto("https://www.linkedin.com/in/elisabeth-laspe-86aa499b/")

$browser.element(:xpath => "//span[text() = 'Message']").wait_until_present.click 

$browser.element(:xpath => "//h4[text()='New message']").wait_until_present

sleep 3

$browser.send_keys("Wish you were here! <3 you, STLQAA (this is another robot, we made this just for you")

$browser.send_keys([:control, :enter])

sleep 3

