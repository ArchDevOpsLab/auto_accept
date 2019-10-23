require "rubygems"
require "watir"

class Browser 

	def initialize(url)
		chromedriver_path = File.join(File.absolute_path("../../webdriver/", File.dirname(__FILE__)),"chromedriver.exe")
		Selenium::WebDriver::Chrome.driver_path = chromedriver_path
		$browser = Watir::Browser.new :chrome
		Navigate.new(url)
	end

end