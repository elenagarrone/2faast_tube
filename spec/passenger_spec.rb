require 'passenger'

describe Passenger do

  let(:passenger) { Passenger.new }

  it "should be initialized not touched-in" do
    expect(passenger.touched?).to be(false)
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
