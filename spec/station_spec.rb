require 'station'
require 'passenger_container'
require 'passenger'

describe Station do

	let(:station)   { Station.new }
	let(:station2)  { Station.new }
	let(:train)     { Train.new }
	let(:passenger) { Passenger.new }
	let(:carriage)  { Carriage.new }


	it "should not be able to dock a train if it doesn't have at least one carriage" do
		expect{ station.dock(train) }.to raise_error{ "A train must have at least one carriage." }
	end

	it "should be able to dock a train only if it has at least one carriage" do
		train.hold(carriage)
		expect{ station.dock(train) }.to change{ station.train_count }.to 1
	end

	it "should be able to undock a train" do
		train.hold(carriage); station.dock(train)
		expect{ station.undock(train) }.to change{ station.train_count }.to 0
	end

	it "should transfer a train from station to station" do
		train.hold(carriage); station.dock(train)
		expect{ station.transfer_train_to(station2) }.to change{ station2.train_count }.to 1
	end

	it "should transfer a passenger from station to station" do
		passenger.add_credit(2); passenger.touch_in
		station.let_in(passenger)
		expect{ station.move_passenger(station2) }.to change{ station2.passenger_count }.to 1
	end

	it "should not release a passengerif the passenger didn't touch-out" do
		passenger.add_credit(2); passenger.touch_in
		station.let_in(passenger)
		expect(station.let_out(passenger)).to eq("Touch out to get out from the station.")
	end

	it "should release a passenger only if he touched-out" do
		passenger.add_credit(2); passenger.touch_in
		station.let_in(passenger); passenger.touch_out
		expect(station.let_out(passenger)).to eq("You can now exit.")
	end

end
