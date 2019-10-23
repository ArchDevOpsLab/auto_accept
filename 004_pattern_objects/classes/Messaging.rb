class Messaging 

	def initialize(message) 
		# clean out extra methods, don't really need them so much
		Actions.new.click("button", "Message")
		Actions.new.wait_for("box", "New message")
		send_message(message) 
	end

	def send_message(message)
		$browser.send_keys(message)
		sleep 3
		$browser.send_keys([:control, :enter])
	end
end