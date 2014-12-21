require_relative 'passenger_container'

class Carriage

  include PassengerContainer

  def initialize(capacity = 40)
    @capacity = capacity
  end

  def release(passenger)
    passengers.delete(passenger)
  end

end
