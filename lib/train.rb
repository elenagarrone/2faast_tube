class Train

	include PassengerContainer

	attr_reader :carriages

	def initialize
		@carriages = []
	end

	def hold(carriage)
		raise "You can't add anymore carriages" if carriage_count > 5
		carriages << carriage
	end

	def unhold(carriage)
		carriages.delete(carriage)
	end

	def carriage_count
		carriages.count
	end

end