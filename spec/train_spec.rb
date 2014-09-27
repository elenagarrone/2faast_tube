require 'train'
require 'carriage'

describe Train do

	let(:train) {Train.new}
	let(:carriage) {Carriage.new}
	
	it "should hold a carriage" do
		expect{train.hold(carriage)}.to change{train.carriage_count}.to 1
	end

	it "should unhold a carriage" do
		train.hold(carriage)
		expect{train.unhold(carriage)}.to change{train.carriage_count}.to 0
	end

end