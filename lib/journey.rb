require_relative 'journey_tracker'
class Journey



  attr_accessor :entry_station, :exit_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize

    @entry_station = nil
    @exit_station = nil



  end

  def fare
    minimum_fare if check_journey_status
    penalty_fare if !check_journey_status

  end

  def journey_beginning?
    @entry_station.nil?
  end

  def set_entry(station)

    @entry_station = station
  end

  def set_exit(station)

    @exit_station = station

  end

  def is_journey_complete?

    @entry_station != nil && @exit_station != nil

  end

  def new_journey?

    @entry_station == nil && @exit_station == nil

  end

  def fare
    if is_journey_complete?
      return MINIMUM_FARE
    else
      return PENALTY_FARE
    end



  end




end
