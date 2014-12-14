class Passenger

	def initialize
		@touch_in = false
	end

	def touched?
		@touch_in
	end

	def touch_in
		@touch_in = true
	end

	def touch_out
		@touch_in = false
	end

end
