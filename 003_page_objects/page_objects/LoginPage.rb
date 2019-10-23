class LoginPage

	def initialize
		@elements = {    
			"username_field" => "//input[@id='username']",
			"password_field" => "//input[@id='password']",
			"sign_in_button" => "//button[text()='Sign in']"
		}
	end 

	def get(element)
		return @elements[element]
	end
end