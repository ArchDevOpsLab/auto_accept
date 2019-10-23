class Messaging 

	def initialize(message) 
		click_message_button
		wait_for_message_box
		send_message(message) 
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
		# don't actually send it, we know it'll work. let's not pester her. 
		# $browser.send_keys([:control, :enter])
	end
end