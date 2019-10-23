class Login
	def initialize
		file = File.open "../support/login.json"
		login_data = JSON.load file
		$browser.text_field(:xpath => "//input[@id='username']").set(login_data['username'])
		$browser.text_field(:xpath => "//input[@id='password']").set(login_data['password'])
		$browser.button(:xpath => "//button[text()='Sign in']").click 
	end
end
