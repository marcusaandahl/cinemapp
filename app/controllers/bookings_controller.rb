class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create]

  def index
    @bookings = Booking.all
  end

  def create
    @session = Session.find(params[:session_id])
    @movie = @session.movie
    @room = @session.room
    @cinema = @room.cinema
    @booking = Booking.new
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end

  private

  def strong_params
    params.require(:booking).permit(:discounted_price)
  end
end
