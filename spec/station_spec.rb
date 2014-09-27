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

end