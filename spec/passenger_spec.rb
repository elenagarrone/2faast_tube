require 'passenger'

describe Passenger do

  let(:passenger) { Passenger.new }

  it "should be initialized not touched-in" do
    expect(passenger.touched?).to be(false)
  end

  it "should have an oyster credit of £0 when initialized" do
    expect(passenger.oyster_credit).to eq(0)
  end

  it "should be able to add credit to the oyster" do
    expect{ passenger.add_credit(5) }.to change{ passenger.oyster_credit }.by 5
  end

  it "should be able to touch-in only with a minimum credit of £2" do
    passenger.add_credit(4)
    expect(passenger.touch_in).to be(true)
    expect(passenger.oyster_credit).to eq(2)
  end

  it "should not be able to touch-in if the oyster credit is less than £2" do
    expect(passenger.touch_in).to eq("You don't have enough credit. Please top-up your oyster card.")
    expect(passenger.touched?).to be(false)
  end

  it "should be able to touch-out" do
    passenger.touch_in
    passenger.touch_out
    expect(passenger.touched?).to be(false)
  end

end
