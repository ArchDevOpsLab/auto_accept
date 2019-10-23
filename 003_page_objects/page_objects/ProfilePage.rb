class ProfilePage

	def initialize
		@elements = {    
			"message_button" => "//span[text() = 'Message']",
			"message_box" => "//h4[text()='New message']",
		}
	end 

	def get(element)
		return @elements[element]
	end
end