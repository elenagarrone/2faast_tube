require 'passenger_container'
require 'passenger'

class ContainerHolder; include PassengerContainer; end

describe PassengerContainer do

	let(:holder) {ContainerHolder.new}
	let(:passenger) {Passenger.new}


	it "should let a passenger in" do
		expect{holder.let_in(passenger)}.to change{holder.passenger_count}.to 1
	end

	it "should release a passenger" do
		holder.let_in(passenger)
		expect{holder.release(passenger)}.to change{holder.passenger_count}.to 0
	end

	it "should not accept people when it's full" do
		40.times {holder.let_in(passenger)}
		expect(lambda{holder.full?}).to raise_error("Sorry, you can\'t access, it\'s full")
	end
	
end