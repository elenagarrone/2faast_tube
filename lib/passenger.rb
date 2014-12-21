class Passenger

  attr_reader :oyster_credit

  def initialize
    @touch_in = false
    @oyster_credit = 0
  end

  def add_credit(pounds)
    @oyster_credit += pounds
  end

  def touched?
    @touch_in
  end

  def touch_in
    if @oyster_credit >= 2
      @oyster_credit -= 2
      return @touch_in = true
    else
      return "You don't have enough credit. Please top-up your oyster card."
    end
  end

  def touch_out
    @touch_in = false
  end

end
