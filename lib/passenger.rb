class Passenger

	attr_reader :oyster_credit

	def initialize
		@touch_in = false
		@oyster_credit = 0
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
