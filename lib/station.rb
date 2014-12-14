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

	def transfer(station)
		@trains.each { |train| undock(train); station.dock(train) }
	end

	def move(station)
		@passengers.each { |passenger| release(passenger); station.let_in(passenger) }
	end

end
