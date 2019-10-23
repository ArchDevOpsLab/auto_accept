class Login
	def initialize
		file = File.open "../support/login.json"
		login_data = JSON.load file
		Actions.new.enter_text("field", "Email or Phone", login_data['username'])
		Actions.new.enter_text("field", "Password", login_data['password'])
		Actions.new.click("button", "Sign in")
		# $browser.text_field(:xpath => "//input[@id='username']").set(login_data['username'])
		# $browser.text_field(:xpath => "//input[@id='password']").set(login_data['password'])
		# $browser.button(:xpath => "//button[text()='Sign in']").click 
	end
end
