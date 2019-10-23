class Profiles

	attr_accessor :profile

	def initialize(person)
		file = File.open "../support/profiles.json"
		profiles = JSON.load file
		@profile = profiles[person]
	end


	
end