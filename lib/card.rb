require_relative 'journey_tracker'
require_relative 'journey'
class Card

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  DEFAULT_BALANCE = 0
  attr_accessor :balance
  attr_reader :journey_current

  def initialize(balance = DEFAULT_BALANCE)

    @balance = balance
    #@journey = false
    @journey_current = Journey.new
    @journey_tracker = JourneyTracker.new(@journey_current)

  end

  def top_up(amount)

    raise too_much if balance_exceeds_top_up_limit(amount)
    add_funds(amount)

  end

  def touch_in(station = Station.new)
    @station = station

    raise not_enough if not_enough_funds
    complete_journey if !@journey_current.entry_station.nil? || !@journey_current.new_journey?
    @journey_tracker.start_station(@station.name)
    # deduct if complete_journey?



    # @stations_visited[:entry].push(station.name)



    #@journey = true

  end

  def touch_out(station = Station.new('kings cross'))
    @station = station
    #@journey = false

    @journey_tracker.end_station(@station.name)
    complete_journey

  end

  #def journey?
    #@journey
  #end


  private

  def balance_exceeds_top_up_limit(amount)
    @balance + amount > MAX_BALANCE
  end

  def in_journey?

    !@entry_station.nil?
  end

  def not_enough_funds

    @balance < MIN_BALANCE

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

  def complete_journey
    p @journey_current.fare
    deduct(@journey_current.fare)
    @journey_tracker.journeys << @journey
    @journey = Journey.new
  end

  def deduct(fare)
    @balance -= fare
  end


  # def stop_journey
  #   deduct if @journey
  #   @entry_station = nil
  #
  # end





end
