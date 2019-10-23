class Actions

	def initialize
	end

	def click(type, replace)
		$browser.element(:xpath => get_xpath(type, replace)).click
	end

	def enter_text(type, replace, text)
		$browser.text_field(:xpath => get_xpath(type, replace)).set(text)
	end

	def wait_for(type, replace)
		$browser.element(:xpath => get_xpath(type, replace)).wait_until_present
	end

	def get_xpath(type, replace)
		return Patterns.new.get(type, replace)
	end
end