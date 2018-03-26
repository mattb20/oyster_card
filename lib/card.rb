class Card

  MAX = 90
  JOURNEY = 2
  attr_accessor :balance
  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    raise too_much if @balance + amount > MAX
    @balance += amount
  end

  def deduct
    @balance -= JOURNEY
  end


  private

  def too_much
   "The maximum you can hold on your card is 90"
  end

end