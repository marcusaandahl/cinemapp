class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(strong_params)
    if @booking.save
      redirect_to edit_booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking.update(strong_params)

    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy

    redirect_to bookings_path
  end

  private
  def set_booking
    @booking = Cocktail.find(params[:id])
  end

  def strong_params
    params.require(:booking).permit(:discounted_price)
  end

end
