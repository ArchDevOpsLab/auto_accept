require "rubygems"
require "watir"
require "json" 

def open_browser
	chromedriver_path = File.join(File.absolute_path("../webdriver/", File.dirname(__FILE__)),"chromedriver.exe")
	puts chromedriver_path

	Selenium::WebDriver::Chrome.driver_path = chromedriver_path
	$browser = Watir::Browser.new :chrome

	$browser.goto("www.linkedin.com/login")
	sleep 3
end

def get_profile_info
	file = File.open "../support/profiles.json"
	$profile_data = JSON.load file
end

def get_login_info
	file = File.open "../support/login.json"
	$login_data = JSON.load file
end

def login
	$browser.text_field(:xpath => "//input[@id='username']").set($login_data['username'])
	$browser.text_field(:xpath => "//input[@id='password']").set($login_data['password'])
	$browser.button(:xpath => "//button[text()='Sign in']").click 
end

def go_to_url(url)
	$browser.goto(url)
end

def click_message_button
	$browser.element(:xpath => "//span[text() = 'Message']").wait_until_present.click 
end

def wait_for_message_box
	$browser.element(:xpath => "//h4[text()='New message']").wait_until_present

end

def send_message(message)
	$browser.send_keys(message)
	sleep 3
	# don't actually send it, we'll give Liz a break. 
	# $browser.send_keys([:control, :enter])
end

def send_message_to_person(message, person)
	open_browser
	get_profile_info
	get_login_info
	login
	go_to_url($profile_data[person])
	click_message_button
	wait_for_message_box
	send_message(message)
end
