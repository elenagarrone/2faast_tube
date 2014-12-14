require 'passenger'

describe Passenger do

  let(:passenger) { Passenger.new }

  it "should be initialized not touched-in" do
    expect(passenger.touched?).to be(false)
  end

  it "should have an oyster credit of 0 when initialized" do
    expect(passenger.oyster_credit).to equal(0)
  end

  it "should be able to touch-in" do
    expect(passenger.touch_in).to be(true)
  end

  it "should be able to touch-out" do
    passenger.touch_in
    passenger.touch_out
    expect(passenger.touched?).to be(false)
  end

end
