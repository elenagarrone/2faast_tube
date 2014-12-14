require 'carriage'
require 'passenger'

describe Carriage do

	let(:carriage)  { Carriage.new }
	let(:passenger) { Passenger.new }

	it 'should be initialized with a capacity of 40' do
		expect(carriage.capacity).to eq(40)
	end

	it "should release a passenger" do
		passenger.add_credit(5); passenger.touch_in
		carriage.let_in(passenger)
		expect{ carriage.release(passenger) }.to change{ carriage.passenger_count }.to 0
	end

end
