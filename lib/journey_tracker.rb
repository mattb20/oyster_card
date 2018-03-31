require_relative 'card'

class JourneyTracker

  attr_reader :journeys, :journey_current

  def initialize(journey_class)

    @journey_current = journey_class
    @journeys = []

  end

  def add(station)

    @journeys.push(station)

  end

  def start_station(station)

    @journey_current.set_entry(station)

  end

  def end_station(station)

    @journey_current.set_exit(station)

  end
end
