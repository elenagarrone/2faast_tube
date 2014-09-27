require_relative 'passenger_container'

class Station

	include PassengerContainer

	attr_reader :trains

	def initialize
		@trains = []
	end

	def train_count
		@trains.count
	end

	def dock(train)
		raise "Sorry, no more train are accepted at this station" if train_count > 4
		@trains << train
	end

	def undock(train)
		@trains.delete(train)
	end

end