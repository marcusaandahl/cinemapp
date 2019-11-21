class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create]

  def index
    @bookings = Booking.all
  end

  def create
    # redirect to a cart
    strong_params[:seat_ids].each do |seat_id|
      booking = Booking.new(user_id: current_user.id, session_id: strong_params[:session_id], discounted_price: 10, integer: 1, seat_id: seat_id)
      booking.save
      Seat.find(seat_id).update_attribute(:booked, true)
    end
    redirect_to movie_session_path(Movie.find(strong_params[:movie_id]), Session.find(strong_params[:session_id]))
  end

  def destroy
  end

  private

  def strong_params
    # strong params
    params.permit(:movie_id, :session_id, {:seat_ids => []})
  end
end
