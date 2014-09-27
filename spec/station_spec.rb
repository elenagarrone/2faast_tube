require 'station'
require 'train'

describe Station do

	let(:station) {Station.new}
	let(:train) {Train.new}

	it "should be able to dock a train" do
		expect{station.dock(train)}.to change{station.train_count}.to 1
	end

	it "should be able to undock a train" do
		station.dock(train)
		expect{station.undock(train)}.to change{station.train_count}.to 0
	end
	
	it "should not dock more than 4 trains at the time" do
		5.times{station.dock(train)}
		expect{station.crowded?}.to raise_error "Sorry, no more train are accepted at this station"
	end

end