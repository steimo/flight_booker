class BookingsController < ApplicationController
  def new
    @booking = Booking.new(date: params[:date], flight_id: params[:flight_id])
    @flight = Flight.find(params[:flight_id])
    @passengers = params[:passengers]
    @passenger = @booking.passengers.build
  end
end
