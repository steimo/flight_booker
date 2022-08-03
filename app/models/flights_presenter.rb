class FlightsPresenter
  def initialize(params)
    @params = params
  end

  def flights
    @flights ||= Flight.all.order('start_time ASC')
  end

  def airports
    @airports ||= Airport.all.map { |a| [a.code, a.id, { class: '' }] }
  end

  def available_flights
    return @available_flights if @available_flights

    @available_flights = Flight.where(departure_airport_id: @params[:departure_airport_id],
                                      arrival_airport_id: @params[:arrival_airport_id])
    @available_flights = @available_flights.where('departure_airport_id != arrival_airport_id')

    if @params[:date]
      @available_flights = @available_flights.where(start_time: @params[:date].all_day)
    end

    @available_flights
  end

  def matching_airports?
    @params[:departure_airport_id] == @params[:arrival_airport_id]
  end

  def date_options
    @date_options ||= flights.map do |flight|
      option = [flight.start_time.strftime('%d %^b %Y')]
      if flight.start_time.present?
        option << flight.start_time.all_day
      end
    end.uniq
  end
end