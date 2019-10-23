class Login
	def initialize
		file = File.open "../support/login.json"
		login_data = JSON.load file

		$browser.text_field(:xpath => LoginPage.new.get("username_field")).set(login_data['username'])
		$browser.text_field(:xpath => LoginPage.new.get("password_field")).set(login_data['password'])
		$browser.button(:xpath => LoginPage.new.get("sign_in_button")).click 
	end
end
