class Card

  MAX = 90
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
    @journey = false
    @station = Station.new
  end

  def top_up(amount)
    raise too_much if @balance + amount > MAX
    @balance += amount
  end

  def touch_in
    raise not_enough if @balance - @station.cost < 0
    deduct
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def journey?
    @journey
  end


  private

  def too_much
   "The maximum you can hold on your card is 90"
  end

  def not_enough
    "Insufficient funds on card"
  end

  def deduct
    @balance -= @station.cost
  end

end