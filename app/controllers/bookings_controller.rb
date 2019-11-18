class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(strong_params)
    if @booking.save
      redirect_to root_path
    else
      render :new # to set
    end
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def strong_params
    params.require(:booking).permit(:discounted_price)
  end
end
