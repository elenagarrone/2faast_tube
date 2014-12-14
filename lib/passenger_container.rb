module PassengerContainer

	DEFAULT_CAPACITY = 200

	attr_reader :passengers

	def passengers
		@passengers ||= []
	end

	def passenger_count
		passengers.count
	end

  def let_in(passenger)
		if passenger.touched?
	  	raise "Sorry, you can't access, it's full"  if full?
	    passengers << passenger
		else
			return "Please, touch-in to enter the station"
		end
  end

	def release(passenger)
		passengers.delete(passenger)
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def full?
		 passenger_count >= capacity
	end

end
