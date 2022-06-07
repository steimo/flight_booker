class BookingsController < ApplicationController
  def new
    @booking = Booking.new(date: params[:date], flight_id: params[:flight_id])
    @flight = Flight.find(params[:flight_id])
    @passengers = params[:passengers]
    @passenger = @booking.passengers.build
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        # PassengerMailer.with(booking: @booking).confirmation_email.deliver
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        @flight = Flight.where(id: @booking.flight_id)
        @passengers = unimportant_params[:passengers]
        @booking.passengers.clear
        @passenger = @booking.passengers.build
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :date, passengers_attributes: %i[name email])
  end

  def unimportant_params
    params.require(:booking).permit(:passengers)
  end
end
