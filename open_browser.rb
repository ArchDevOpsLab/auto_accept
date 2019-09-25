require "rubygems"
require "watir"

# set up a browser object--need the path to chromedriver, then set up the driver, then use it to 
# bring up the browser
chromedriver_path = File.join(File.absolute_path("webdriver/", File.dirname(__FILE__)),"chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$browser = Watir::Browser.new :chrome

# go go gadget make it bigger
$browser.driver.manage.window.maximize

# navigate to a site--linkedin.com. let's go directly to the login page
$browser.goto("linkedin.com/login")

# sleep a little bit to see it come up
sleep 3