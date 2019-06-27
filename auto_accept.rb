require "rubygems"
require "watir"
require "json"

login_info = JSON.parse(File.read("support/login.json"))

intro_message = "Hey thanks for connecting! Appreciate being in your network. What's on your mind today?"

# client = Selenium::WebDriver::Remote::Http::Default.new
# client.read_timeout = 600
chromedriver_path = File.join(File.absolute_path("webdriver/", File.dirname(__FILE__)),"chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$browser = Watir::Browser.new :chrome

# $browser = Watir::Browser.new :chrome, :http_client => client
$browser.driver.manage.window.maximize
$browser.goto("linkedin.com/login")
$browser.text_field(id: "username").set(login_info["username"])
$browser.text_field(id: "password").set(login_info["password"])
$browser.element(tag_name: "form",class: "login__form").button(type:"submit" ).click

sleep 5

begin
	while true
		
		$browser.goto("https://www.linkedin.com/mynetwork/invitation-manager/")

		while not $browser.url.include?("manager")
			sleep 0.1
		end
		puts "On invitation manager page"
		STDOUT.flush
		$browser.element(:xpath => "(//span[text()='Message'])[1]").click
		puts "Clicked the Message link"
		STDOUT.flush
		sleep 5

		# $browser.element(:xpath => "//textarea[@name='message']").click
		# puts "Clicked the message area in the person's message pane"
		# STDOUT.flush
		# sleep 1

		$browser.send_keys(intro_message)
		sleep 1
		$browser.send_keys([:control, :enter])
		
		# $browser.element(:xpath => "//button[@type='submit']").click
		# puts "Clicked submit/send button"
		
		puts "Typed ctrl-enter to send message"
		STDOUT.flush 
		sleep 10

		$browser.send_keys([:escape])
		puts "Typed escape to close out message window"
		STDOUT.flush 
		sleep 2		

		$browser.element(:xpath => "(//span[text()='Accept'])[1]").click
		puts "Clicked Accept for the first person"
		STDOUT.flush
		sleep 2
	end

rescue Watir::Element::UnknownObjectException => e
	puts "Done! Didn't find any more connections to accept"
	# if there aren't any message elements on the screen that's fine 
end
