require 'station'
require 'passenger_container'
require 'passenger'

describe Station do

	let(:station)   { Station.new }
	let(:station2)  { Station.new }
	let(:train)     { Train.new }
	let(:passenger) { Passenger.new }


	it "should be able to dock a train" do
		expect{ station.dock(train) }.to change{ station.train_count }.to 1
	end

	it "should be able to undock a train" do
		station.dock(train)
		expect{ station.undock(train) }.to change{ station.train_count }.to 0
	end

	it "should transfer a train from station to station" do
		station.dock(train)
		expect{ station.transfer_train_to(station2) }.to change{ station2.train_count }.to 1
	end

	it "should transfer a passenger from station to station" do
		passenger.touch_in
		station.let_in(passenger)
		expect{ station.move_passenger(station2) }.to change{ station2.passenger_count }.to 1
	end

end
