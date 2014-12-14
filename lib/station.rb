require_relative 'passenger_container'

class Station

	include PassengerContainer

	attr_reader :trains, :passengers

	def initialize
		@trains = []
		@passengers = []
	end

	def train_count
		@trains.count
	end

	def dock(train)
		raise "Sorry, no more train are accepted at this station" if train_count >= 4
		@trains << train
	end

	def undock(train)
		@trains.delete(train)
	end

	def transfer_train_to(stationB)
		@trains.each { |train| undock(train); stationB.dock(train) }
	end

	def move_passenger(stationB)
		@passengers.each { |passenger| release(passenger); stationB.let_in(passenger) }
	end

	def let_out(passenger)
		if !passenger.touched?
			passengers.delete(passenger)
			return "You can now exit."
		else
			return "Touch out to get out from the station."
		end
	end

end
