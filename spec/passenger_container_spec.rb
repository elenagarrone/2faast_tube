require 'passenger_container'

class ContainerHolder; include PassengerContainer; end

describe PassengerContainer do

	let(:holder)    { ContainerHolder.new }
	let(:passenger) { Passenger.new }


	it "should let a passenger in only if the passenger touched-in" do
		passenger.touch_in
		expect{ holder.let_in(passenger) }.to change{ holder.passenger_count }.to 1
	end

	it "should not let a passenger in if the passenger has not touched-in" do
		expect(holder.let_in(passenger)).to eq("Please, touch-in to enter the station")
	end

	it "should release a passenger" do
		passenger.touch_in
		holder.let_in(passenger)
		expect{ holder.release(passenger) }.to change{ holder.passenger_count }.to 0
	end

	it "should not accept people when it's full" do
		200.times { passenger.touch_in; holder.let_in(passenger) }
		expect{ passenger.touch_in; holder.let_in(passenger) }.to raise_error("Sorry, you can't access, it's full")
	end

	it "should know if its full" do
		200.times { passenger.touch_in; holder.let_in(passenger) }
		expect(holder).to be_full
	end

end
