require_relative 'fare'
require_relative 'station'

class Card

  MAX = 90
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
    @journey = false
    @fare = Fare.new
    @station  = Station.new


  end

  def top_up(amount)
    raise too_much if @balance + amount > MAX
    @balance += amount
  end

  def touch_in(station)
    raise not_enough if @balance - @fare.minimum_fare < 0

    @journey = true

  end

  def touch_out
    deduct
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
    @balance -= @fare.minimum_fare
  end

end
