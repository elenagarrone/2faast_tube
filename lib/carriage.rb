class Carriage

	include PassengerContainer

	def initialize(capacity = 15)
		@capacity = capacity
	end

end