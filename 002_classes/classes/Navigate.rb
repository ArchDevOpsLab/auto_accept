require "rubygems"
require "watir"

class Navigate 

	def initialize(url)
		$browser.goto(url)
	end

end