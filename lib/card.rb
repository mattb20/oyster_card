
class Card

  MAX = 90
  attr_accessor :balance
  attr_accessor :stations_visited


  def initialize(balance = 0, stations_visited = {:entry => [], :exit => []}, entry_station = nil)

    @balance = balance
    #@journey = false
    @fare = Fare.new
    @entry_station = entry_station
    @stations_visited = stations_visited



  end

  def top_up(amount)

    raise too_much if balance_exceeds_top_up_limit(amount)
    add_funds(amount)

  end

  def touch_in(station = Station.new)

    raise not_enough if not_enough_funds


    @entry_station = station.name
    @stations_visited[:entry].push(station.name)



    #@journey = true

  end

  def touch_out(station = Station.new('kings cross'))
    deduct
    #@journey = false
    stop_journey
    @stations_visited[:exit].push(station.name)

  end

  #def journey?
    #@journey
  #end

  def in_journey?

    !@entry_station.nil?
  end





  private

  def balance_exceeds_top_up_limit(amount)
    @balance + amount > MAX
  end

  def not_enough_funds
    @balance - @fare.minimum_fare < 0
  end

  def add_funds(amount)
    @balance += amount
  end

  def too_much
   "The maximum you can hold on your card is 90"
  end

  def not_enough
    "Insufficient funds on card"
  end

  def deduct
    @balance -= @fare.minimum_fare
  end

  def stop_journey
    @entry_station = nil

  end



end
